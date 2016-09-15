<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window"
	component="$UI/system/components/justep/window/window">
	<div component="$UI/system/components/justep/model/model" xid="model">
		<div component="$UI/system/components/justep/data/bizData" xid="orderData"
			autoLoad="true" concept="DEMO_Order" orderBy="fCustomerName:desc"
			confirmRefresh="false" limit="5">
			<reader action="/demo/misc/logic/action/queryOrderForSocialAction" />
		</div>
	</div>

	<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full">
		<div class="x-panel-top">
			<div component="$UI/system/components/justep/titleBar/titleBar"
				title="关注" class="x-titlebar">
				<div class="x-titlebar-left">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon" icon="icon-chevron-left"
						onClick="backBtnClick" xid="backBtn">
						<i class="icon-chevron-left" />
						<span></span>
					</a>
				</div>
				<div class="x-titlebar-title">关注</div>
				<div class="x-titlebar-right reverse">
				</div>
			</div>
		</div>
		<div class="x-panel-content" refresh="true">
			<div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
				data="orderData" limit="20">
				<div class="x-list-content">
					<ul class="x-list-template">
						<li class="list-group-item"
							bind-css="{ 'x-currentRow': $model.orderData.currentRow.get() == $object }"
							>
							<div class="x-row x-row-center" component="$UI/system/components/justep/row/row">
								<div class="x-col" style="font-weight:bold">
									<span component="$UI/system/components/justep/output/output"
										data="orderData" bind-ref="ref('fCustomerName')" />
								</div>
								<div class="x-col">
									<span component="$UI/system/components/justep/output/output"
										data="orderData" bind-ref="ref('fTolotalAmt')" />
								</div>
								<div class="x-col">
									<span component="$UI/system/components/justep/social/focus/focus"
										bind-nameRef="ref('fCustomerName')" data="orderData" bind-ref="ref('sFocus')"/>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

