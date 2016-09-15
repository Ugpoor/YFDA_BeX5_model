import java.util.UUID;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;

class ReloadOrgResultProcessor implements PacketListener, PacketFilter {
	public String id;
	public boolean ok = false;

	public void processPacket(Packet packet) {
		synchronized (this) {
			ok = true;
			notifyAll();
		}
	}

	public boolean accept(Packet packet) {
		return id != null && packet != null && packet.getPacketID() != null
				&& packet.getPacketID().equals(id);
	}
}

public class XMsgClient {
	public synchronized static boolean reloadOrg(String host, int port, String user,
			String password) throws XMPPException, InterruptedException {
		final String uid = UUID.randomUUID().toString().replaceAll("-", "");
		ReloadOrgResultProcessor processor = new ReloadOrgResultProcessor();
		processor.id = uid;
		ConnectionConfiguration xmppConnectionConfiguration = new ConnectionConfiguration(
				host, port);
		XMPPConnection xmpp = new XMPPConnection(xmppConnectionConfiguration);
		xmpp.connect();
		try {
			xmpp.login(user, password);
			xmpp.addPacketListener(processor, processor);
			String jid = xmpp.getUser();
			int i = jid.indexOf('@');
			int j = jid.indexOf('/');
			if (j == -1)
				j = jid.length();
			final String domain = jid.substring(i + 1, j);
			xmpp.sendPacket(new Packet() {
				@Override
				public String toXML() {
					return "<iq type=\"get\" id=\""
							+ uid
							+ "\" to=\"xmsgorg."
							+ domain
							+ "\"><query xmlns=\"jabber:iq:orgs:reload\"/></iq>";
				}
			});
			synchronized (processor) {
				if (processor.ok)
					return true;
				processor.wait(5 * 60 * 1000);
				return processor.ok;
			}
		} finally {
			xmpp.disconnect();
		}
	}
}
