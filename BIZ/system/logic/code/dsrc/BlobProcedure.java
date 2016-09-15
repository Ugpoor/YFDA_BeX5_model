import java.io.InputStream;
import java.sql.Timestamp;

import com.justep.system.data.BlobUtils;


public class BlobProcedure {
	public static Timestamp delete(String blobDataModel, String blobConcept, String blobRelation, String blobLastModifiedRelation, String blobConceptValue) throws Exception {
		return BlobUtils.delete(blobDataModel, blobConcept, blobRelation, blobLastModifiedRelation, blobConceptValue);
	}
	
	public static InputStream query(String blobDataModel, String blobConcept, String blobRelation, String blobConceptValue) throws Exception {
		return BlobUtils.query(blobDataModel, blobConcept, blobRelation, blobConceptValue);
	}

	public static Timestamp queryLastModified(String blobDataModel, String blobConcept, String blobLastModifiedRelation, String blobConceptValue) throws Exception {
		return BlobUtils.queryLastModified(blobDataModel, blobConcept, blobLastModifiedRelation, blobConceptValue);
	}

	public static Timestamp update(String blobDataModel, String blobConcept, String blobRelation, String blobLastModifiedRelation, String blobConceptValue, String limitSize, InputStream blobData) throws Exception {
		return BlobUtils.update(blobDataModel, blobConcept, blobRelation, blobLastModifiedRelation, blobConceptValue, limitSize, blobData);
	}
}
