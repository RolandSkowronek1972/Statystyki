﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ZarzadzanieFormularzami.ascx.cs" Inherits="Statystyki_2018.UserControlls.ZarzadzanieFormularzami" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<link href="../style/MUstyles.css" rel="stylesheet" type="text/css" />

<dx:ASPxComboBox ID="CBRodzaje" runat="server" Theme="Moderno" Width="391px">
	<ClientSideEvents SelectedIndexChanged="function(s, e) {
	   document.getElementById('box1').style.display = 'none';
	   document.getElementById('box2').style.display = 'none';
	   document.getElementById('box3').style.display = 'none';
	   document.getElementById('box4').style.display = 'none';
	   document.getElementById('box5').style.display = 'none';
	   document.getElementById('box6').style.display = 'none';
	   document.getElementById('box7').style.display = 'none';
	
		if   (s.GetValue()==1)
		{
				document.getElementById('box1').style.display = 'block';
		}
		if   (s.GetValue()==2)
		{
				document.getElementById('box3').style.display = 'block';
		}
		if   (s.GetValue()==3)
		{
				document.getElementById('box2').style.display = 'block';
		}
		   if   (s.GetValue()==4)
		{
				document.getElementById('box4').style.display = 'block';
		}
		  if   (s.GetValue()==5)
		{
				document.getElementById('box5').style.display = 'block';
		}
		  if   (s.GetValue()==6)
		{
				document.getElementById('box6').style.display = 'block';
		}
		   if   (s.GetValue()==7)
		{
				document.getElementById('box7').style.display = 'block';
		}
}"
		Init="function(s, e) {
		document.getElementById('box1').style.display = 'block';
		document.getElementById('box2').style.display = 'none';
		document.getElementById('box3').style.display = 'none';
		document.getElementById('box4').style.display = 'none';
		document.getElementById('box5').style.display = 'none';
		document.getElementById('box6').style.display = 'none';
		document.getElementById('box7').style.display = 'none';

}" />
</dx:ASPxComboBox>

<style>
	.butn1 {
		background-position: 0% 0%;
		background-image: linear-gradient(to bottom, #fea004, #D04411) !important;
	   
		-webkit-border-radius: 6px !important;
		-moz-border-radius: 6px !important;
		border-radius: 6px !important;
		height: 10px !important;
		line-height: 10px !important;
		color: #FFFFFF !important;
		font-family: Open Sans !important;
		width: 129px !important;
		font-size: 20px !important;
		font-weight: 200 !important;
		padding: 13px !important;
		text-shadow: 1px 1px 20px #000000 !important;
		border: solid #FFFFFF 1px !important;
		text-decoration: none !important;
		display: inline-block !important;
		cursor: pointer !important;
		background-color: #F6D014 !important;
		background-repeat: repeat !important;
		background-attachment: scroll !important;
	}

		.butn1:hover {
			background-position: 0% 0%;
			background-image: linear-gradient(to bottom, #F6D014, #F6450F) !important ;
			text-decoration: none !important;
			background-color: #F6D014 !important;
			background-repeat: repeat !important;
			background-attachment: scroll !important;
		}

	.dxgvControl_Mulberry,
	.dxgvDisabled_Mulberry {
		font: 14px 'Segoe UI','Helvetica Neue','Droid Sans',Arial,Tahoma,Geneva,Sans-serif;
		color: #343434;
		background-color: #FFFFFF;
		cursor: default;
	}

	.dxgvDisabled_Mulberry {
		color: #dddddd;
	}

	.dxgvControl_Mulberry a.dxeHyperlink:not([href]):not([onclick]):not(.dxbButtonSys) {
		color: #F78119;
		text-decoration: none;
	}

	.dxgvControl_Mulberry a {
		color: #F78119;
	}

		.dxgvControl_Mulberry a:hover {
			color: #343434;
		}

			.dxgvControl_Mulberry a:hover.dxbDisabled_Mulberry {
				color: #F78119;
			}

	.dxgvDisabled_Mulberry a {
		color: #FF8C00;
	}

	.dxgvDataRow_Mulberry.dxgvLVR > td.dxgv,
	.dxgvGroupRow_Mulberry.dxgvLVR > td.dxgv,
	.dxgvInlineEditRow_Mulberry.dxgvLVR > td.dxgv,
	.dxgvEditForm_Mulberry.dxgvLVR > td.dxgv {
		border-bottom-width: 1px !important;
	}

	.dxgvRBB .dxgvDataRow_Mulberry.dxgvLVR > td.dxgv,
	.dxgvRBB .dxgvGroupRow_Mulberry.dxgvLVR > td.dxgv {
		border-bottom-width: 1px !important;
	}

	.dxgvGroupRow_Mulberry td.dxgv.dxgvPHEC, .dxgvPreviewRow_Mulberry td.dxgv.dxgvPHEC,
	.dxgvDetailRow_Mulberry td.dxgv.dxgvPHEC, .dxgvGroupFooter_Mulberry td.dxgv.dxgvPHEC,
	.dxgvDataRow_Mulberry td.dxgvPHEC {
		border-right: 1px Solid #cbcbcb;
	}

	.dxgvLoadingPanel_Mulberry {
		font: 14px 'Segoe UI','Helvetica Neue','Droid Sans',Arial,Tahoma,Geneva,Sans-serif;
		color: #343434;
		background-color: White;
		border: 1px solid #cfcfcf;
		box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.1);
		-webkit-box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.1);
	}

		.dxgvLoadingPanel_Mulberry td.dx {
			white-space: nowrap;
			text-align: center;
			padding: 24px 36px 24px 26px;
		}

		.dxgvLoadingPanel_Mulberry .dxlp-loadingImage {
			background-image: url('../Web/Loading.gif');
			height: 40px;
			width: 40px;
		}

	.dxgvLoadingPanelStatusBar_Mulberry .dxlp-loadingImage {
		background-image: url('gvLoadingOnStatusBar.gif');
		height: 16px;
		width: 16px;
	}

	.dxgvLoadingPanelStatusBar_Mulberry {
		background-color: transparent;
	}

		.dxgvLoadingPanelStatusBar_Mulberry td {
			white-space: nowrap;
			text-align: center;
			padding: 0px 2px;
		}

	.dxgvFilterPopupWindow_Mulberry {
		color: Black;
		border: 1px solid #A3C0E8;
	}

	.dxgvFilterPopupItemsArea_Mulberry {
		color: Black;
		background-color: #FFFFFF;
	}

	.dxgvFilterPopupButtonPanel_Mulberry {
		background-color: #ECF4FE;
		border: 1px solid #cbcbcb;
		color: #2C4D79;
	}

	.dxgvFilterPopupItem_Mulberry td.dxgv,
	.dxgvFilterPopupActiveItem_Mulberry td.dxgv,
	.dxgvFilterPopupSelectedItem_Mulberry td.dxgv {
		padding: 3px 2px 4px 4px;
		cursor: default;
		white-space: nowrap;
	}

	.dxgvFilterPopupActiveItem_Mulberry {
		background-color: #FFE7A2;
		color: Black;
	}

	.dxgvFilterPopupSelectedItem_Mulberry {
		color: Black;
		background-color: #FFBD69;
	}

	.dxgvControl_Mulberry .dxeListBox_Mulberry {
		background-color: #FFFFFF;
	}

	.dxgvTable_Mulberry {
		background-color: #FFFFFF;
		border: Solid 1px #cbcbcb;
		border-top: 0;
		border-bottom: 0;
		border-collapse: separate !important;
		overflow: hidden;
	}

		.dxgvTable_Mulberry .dxgvHEC {
			background-color: #FFFFFF;
			border: 0;
			overflow: hidden;
		}

	div > .dxgvTable_Mulberry {
		border-right: 0;
		border-left: 0;
	}

	.dxgvControl_Mulberry .dxgvHSDC {
		border-right: Solid 1px #cbcbcb;
		border-left: Solid 1px #cbcbcb;
		border-top: Solid 1px #cbcbcb;
	}

		.dxgvControl_Mulberry .dxgvHSDC .dxgvHeader_Mulberry {
			border-top: 0 !important;
		}

	.dxgvControl_Mulberry .dxgvCSD .dxgvHeader_Mulberry {
		border-top: 0;
	}

	.dxgvControl_Mulberry .dxgvFSDC {
		border-right: Solid 1px #cbcbcb;
		border-left: Solid 1px #cbcbcb;
		border-bottom: Solid 1px #cbcbcb;
	}

		.dxgvControl_Mulberry .dxgvFSDC .dxgvFooter_Mulberry td.dxgv {
			border-bottom-width: 0;
		}

	.dxgvControl_Mulberry .dxgvFGI {
		position: absolute;
		top: 0;
		bottom: 0;
		margin: auto;
	}

	.dxgvControl_Mulberry .dxgvFGI {
		right: 5px;
		left: auto;
	}

	*[dir="rtl"].dxgvControl_Mulberry .dxgvFGI {
		right: auto;
		left: 5px;
	}

	.dxgvControl_Mulberry .dxgvCSD {
		border: Solid 1px #cbcbcb;
	}

	.dxeDropDownWindow_Mulberry .dxgvControl_Mulberry .dxgvCSD,
	.dxeDropDownWindow_Mulberry .dxgvControl_Mulberry .dxgvHSDC,
	.dxeDropDownWindow_Mulberry .dxgvControl_Mulberry .dxgvFSDC {
		border: 0;
	}

	.dxgvControl_Mulberry .dxgvHSDC + .dxgvCSD {
		border-top: 0;
	}

	.dxgvControl_Mulberry .dxgvFCSD {
		border-right: Solid 1px #cbcbcb;
		border-left: Solid 1px #cbcbcb;
		border-bottom: Solid 1px #cbcbcb;
	}

	.dxgvDataRowAlt_Mulberry {
		background-color: #eff0f5;
	}

	.dxgvEditForm_Mulberry > td.dxgv {
		border-bottom: 1px Solid #cbcbcb;
		padding: 10px 15px;
	}

	.dxgvEditForm_Mulberry > td.dxgvIndentCell {
		border-top-width: 0px;
		border-right: 1px Solid #cbcbcb;
	}

	.dxgvSelectedRow_Mulberry {
		background-color: #efd3da;
	}

	.dxgvPreviewRow_Mulberry {
		background-color: white;
		color: #8d8d8d;
	}

		.dxgvDetailRow_Mulberry td.dxgv,
		.dxgvPreviewRow_Mulberry td.dxgv,
		.dxgvEmptyDataRow_Mulberry td.dxgv {
			padding: 12px 15px 12px 20px;
			border-bottom: 1px Solid #cbcbcb;
			border-top-width: 0;
			border-left-width: 0;
			border-right-width: 0;
		}

		.dxgvPreviewRow_Mulberry td.dxgvIndentCell,
		.dxgvDetailRow_Mulberry td.dxgvIndentCell {
			padding: 8px 10px;
			border-bottom: 1px Solid #cbcbcb;
			border-right: 1px Solid #cbcbcb;
		}

	.dxgvDetailRow_Mulberry.dxgvADR .dxgvADT > tbody > tr > td {
		padding: 8px 6px 7px 0;
	}

		.dxgvDetailRow_Mulberry.dxgvADR .dxgvADT > tbody > tr > td .dxeTextBoxSys,
		.dxgvDetailRow_Mulberry.dxgvADR .dxgvADT > tbody > tr > td .dxichCellSys {
			margin: -8px 0 -5px 0;
		}

	.dxgvDetailRow_Mulberry.dxgvADR .dxgvADCC {
		color: #7F7F7F;
	}

	.dxgvDetailRow_Mulberry.dxgvADR.dxgvFocusedRow_Mulberry .dxgvADCC,
	.dxgvDetailRow_Mulberry.dxgvADR.dxgvFocusedRow_Mulberry .dxgvADDC {
		color: white;
	}

	.dxgvAH + .dxgvDetailRow_Mulberry.dxgvADR > td.dxgv,
	.dxgvDetailRow_Mulberry.dxgvADR:last-child td.dxgv {
		border-top: 0;
	}

	.dxGridView_gvDetailExpandedButton_Mulberry,
	.dxGridView_gvDetailCollapsedButton_Mulberry {
		margin: 2px 0 -2px;
	}

	.dxgvEmptyDataRow_Mulberry {
		color: #4F4F4F;
	}

		.dxgvEmptyDataRow_Mulberry td.dxgv {
			text-align: center;
			border-bottom-width: 1px !important;
		}

	.dxgvTable_Mulberry > tbody > tr:first-child.dxgvEmptyDataRow_Mulberry td.dxgv {
		border-top: 1px solid #cbcbcb;
	}

	.dxgvEditFormDisplayRow_Mulberry td.dxgv,
	.dxgvInlineEditRow_Mulberry td.dxgv,
	.dxgvDetailCell_Mulberry td.dxgv,
	.dxgvDataRow_Mulberry td.dxgv,
	.dxgvDetailRow_Mulberry.dxgvADR td.dxgvAIC {
		overflow: hidden;
		border-top-width: 0;
		border-left-width: 0;
		border-bottom: 1px Solid #cbcbcb;
		border-right: 1px Solid #cbcbcb;
		padding: 5px 10px 6px;
	}

	.dxgvDataRow_Mulberry td.dxgvAIC {
		border-bottom-width: 0;
	}

	.dxgvDetailRow_Mulberry.dxgvADR .dxgvDetailCell_Mulberry,
	.dxgvDetailRow_Mulberry.dxgvADR td.dxgvAIC {
		border-top: 1px Solid #cbcbcb;
	}

	.dxgvDataRow_Mulberry td.dxgvAIC,
	.dxgvInlineEditRow_Mulberry td.dxgv.dxgvAIC {
		padding: 0 10px;
	}

	.dxgvDetailRow_Mulberry.dxgvADR td.dxgvAIC {
		padding: 12px 10px;
	}

		.dxgvDetailRow_Mulberry.dxgvADR td.dxgvAIC:last-child {
			border-right: 0;
		}

	.dxgvEditFormDisplayRow_Mulberry:last-child td.dxgv,
	.dxgvInlineEditRow_Mulberry:last-child td.dxgv,
	.dxgvDataRow_Mulberry:last-child td.dxgv,
	.dxgvDetailRow_Mulberry:last-child > td.dxgv {
		border-bottom: 1px Solid #cbcbcb !important;
	}

	.dxgvEditFormDisplayRow_Mulberry:first-child td.dxgv,
	.dxgvInlineEditRow_Mulberry:first-child td.dxgv,
	.dxgvDataRow_Mulberry:first-child td.dxgv,
	.dxgvEditFormDisplayRow_Mulberry.dxgvFVR > td.dxgv,
	.dxgvInlineEditRow_Mulberry.dxgvFVR > td.dxgv,
	.dxgvDataRow_Mulberry.dxgvFVR > td.dxgv {
		border-top: 1px Solid #cbcbcb !important;
	}

	.dxgvTable_Mulberry:not(.dxgvCMV):not(.dxgvABRL):not([dir="rtl"]) .dxgvEditFormDisplayRow_Mulberry td.dxgv:last-child:not(.dxgvMCLN),
	.dxgvTable_Mulberry:not(.dxgvCMV):not(.dxgvABRL):not([dir="rtl"]) .dxgvInlineEditRow_Mulberry td.dxgv:last-child:not(.dxgvMCLN),
	.dxgvTable_Mulberry:not(.dxgvCMV):not(.dxgvABRL):not([dir="rtl"]) .dxgvDataRow_Mulberry td.dxgv:last-child:not(.dxgvMCLN),
	.dxgvTable_Mulberry:not(.dxgvCMV):not(.dxgvABRL):not([dir="rtl"]) .dxgvDataRowAlt_Mulberry td.dxgv:last-child:not(.dxgvMCLN),
	.dxgvTable_Mulberry:not([dir="rtl"]) .dxgvHeader_Mulberry.RRB {
		border-right: 0 !important;
	}

	.dxgvTable_Mulberry .dxgvPBVC {
		border-bottom-width: 1px !important;
	}

	.dxgvDataRow_Mulberry .dxICheckBox_Mulberry,
	.dxgvInlineEditRow_Mulberry .dxICheckBox_Mulberry,
	.dxgvDataRow_Mulberry .dxeIRadioButton_Mulberry,
	.dxgvInlineEditRow_Mulberry .dxeIRadioButton_Mulberry {
		margin: -6px 1px -3px;
	}

	.dxgvCommandColumn_Mulberry .dxICheckBox_Mulberry,
	.dxgvCommandColumn_Mulberry .dxeIRadioButton_Mulberry {
		margin: -4px 1px -5px;
	}

	.dxgvCommandColumn_Mulberry,
	.dxgvEditFormDisplayRow_Mulberry td.dxgvCommandColumn_Mulberry,
	.dxgvDataRow_Mulberry td.dxgvCommandColumn_Mulberry {
		padding: 3px 10px 6px;
		white-space: nowrap;
	}

	.dxgvEditFormDisplayRow_Mulberry {
		background-color: #FFFFFF;
	}

		.dxgvEditFormDisplayRow_Mulberry td.dxgvIndentCell {
			border-right: 1px Solid #cbcbcb;
			border-left: 1px Solid #cbcbcb;
			border-top-width: 0px;
		}

	.dxgvEditingErrorRow_Mulberry {
		background-color: #F3D6D6;
		color: #BA1717;
	}

		.dxgvEditingErrorRow_Mulberry td.dxgv {
			white-space: pre-wrap;
			border-bottom: 1px Solid #A3C0E8;
			border-right-width: 0;
			border-top-width: 0;
			border-left-width: 0;
			padding: 6px 12px;
		}

	.dxgvInlineEditRow_Mulberry td.dxgv {
		padding: 1px;
	}

	.dxgvInlineEditRow_Mulberry td.dxgvIndentCell {
		background-color: white;
	}

	.dxgvFilterRow_Mulberry td.dxgv {
		border-bottom: 1px Solid #cbcbcb;
		border-right-width: 0px;
		border-top-width: 0;
		border-left-width: 0;
		padding: 1px;
		overflow: hidden;
	}

	.dxgvGroupRow_Mulberry {
		color: #8d8d8d;
		background-color: #FFFFFF;
	}

	.dxgvFocusedGroupRow_Mulberry {
		background-color: #BF4E6A;
		color: white;
	}

		.dxgvGroupRow_Mulberry td.dxgv,
		.dxgvFocusedGroupRow_Mulberry td.dxgv {
			border: 0;
			border-bottom: 1px Solid #cbcbcb;
			vertical-align: middle;
			padding: 5px 10px 6px;
			background-color: inherit;
		}

		.dxgvGroupRow_Mulberry:last-child td.dxgv,
		.dxgvFocusedGroupRow_Mulberry:last-child td.dxgv {
			border-bottom: 1px Solid #cbcbcb !important;
		}

	.dxGridView_gvExpandedButton_Mulberry,
	.dxGridView_gvCollapsedButton_Mulberry {
		margin: 2px 0 -2px;
	}

	.dxgvFocusedGroupRow_Mulberry td.dxgvIndentCell,
	.dxgvFocusedRow_Mulberry td.dxgvIndentCell,
	.dxgvSelectedRow_Mulberry td.dxgvIndentCell {
		border-top-width: 0px;
		border-right: 1px Solid #cbcbcb;
	}

	.dxgvFocusedRow_Mulberry td.dxgvCommandColumn_Mulberry a {
		color: #5e6d9d;
	}

	.dxgvFocusedRow_Mulberry {
		background-color: #BF4E6A;
		color: white;
	}

		.dxgvFocusedRow_Mulberry td.dxgv a,
		.dxgvFocusedRow_Mulberry td.dxgv span,
		.dxgvFocusedRow_Mulberry td.dxgvCommandColumn_Mulberry a {
			color: white;
		}

		.dxgvFocusedRow_Mulberry td.dxgv .dxbButton_Mulberry span {
			color: #343434;
		}

		.dxgvFocusedRow_Mulberry td.dxgv .dxeCalendarHeader_Mulberry span {
			color: #676767;
		}

		.dxgvFocusedRow_Mulberry .dxgvADSB > img {
			opacity: 1;
		}

	.dxgvHeaderPanel_Mulberry {
		color: #979797;
		white-space: nowrap;
		border-top: 1px Solid #cbcbcb;
		border-bottom: 1px Solid #cbcbcb;
		padding: 8px 4px 7px 6px;
	}

	.dxIE .dxgvMSDraggable .dxgvHeader_Mulberry,
	.dxIE .dxgvMSDraggable.dxgvGroupPanel_Mulberry {
		-ms-touch-action: pinch-zoom;
	}

	.dxEdge .dxgvMSDraggable .dxgvHeader_Mulberry,
	.dxEdge .dxgvMSDraggable.dxgvGroupPanel_Mulberry {
		touch-action: pinch-zoom;
	}

	.dxgvHeader_Mulberry {
		cursor: pointer;
		white-space: nowrap;
		padding: 4px 10px 5px;
		border: 1px Solid #cbcbcb;
		background: white;
		overflow: hidden;
		font-weight: normal;
		text-align: left;
	}

	tr:first-child > .dxgvHeader_Mulberry,
	tr[id$="DXHeadersRow0"] > .dxgvHeader_Mulberry {
		border-top-width: 1px !important;
	}

	.dxgvHeader_Mulberry a,
	.dxgvHeader_Mulberry a:hover {
		color: #BF4E6A;
	}

		.dxgvHeader_Mulberry a.dxgvCommandColumnItem_Mulberry.dxbDisabled_Mulberry,
		.dxgvCommandColumn_Mulberry a.dxgvCommandColumnItem_Mulberry.dxbDisabled_Mulberry {
			color: #5e6d9d;
		}

	.dxgvHeader_Mulberry,
	.dxgvHeader_Mulberry table {
		color: #8d8d8d;
	}

		.dxgvHeader_Mulberry td {
			white-space: nowrap;
		}

		.dxgvHeader_Mulberry a.dxgvCommandColumnItem_Mulberry {
			margin: 0px 5px 0px 0px;
			vertical-align: middle;
		}

			.dxgvHeader_Mulberry a.dxgvCommandColumnItem_Mulberry.dxbDisabled_Mulberry,
			.dxgvCommandColumn_Mulberry a.dxgvCommandColumnItem_Mulberry.dxbDisabled_Mulberry {
				opacity: 0.5;
			}

	.dxgvCustomization_Mulberry,
	.dxgvPopupEditForm_Mulberry {
		padding: 0;
		margin: 0;
	}

	.dxgvAdaptiveGroupPanel_Mulberry,
	.dxgvGroupPanel_Mulberry {
		color: #8d8d8d;
	}

	.dxgvGroupPanel_Mulberry {
		border-top: 1px Solid #cbcbcb;
		padding: 14px 4px 14px 6px;
		white-space: nowrap;
	}

		.dxgvGroupPanel_Mulberry:first-child {
			border-top: 0;
		}

	.dxgvAdaptiveGroupPanel_Mulberry {
		padding-left: 6px;
		padding-top: 14px;
	}

		.dxgvAdaptiveGroupPanel_Mulberry div.dxgvADH {
			margin-right: 4px;
			margin-bottom: 12px;
		}

		.dxgvAdaptiveGroupPanel_Mulberry.dxgvEAHP {
			padding-bottom: 14px;
		}

	.dxgvAdaptiveHeaderPanel_Mulberry {
		color: #8d8d8d;
		border-top: 1px Solid #cbcbcb;
		border-bottom: 1px Solid #cbcbcb;
		padding-top: 10px;
	}

		.dxgvAdaptiveHeaderPanel_Mulberry.dxgvEAHP {
			padding: 10px 7px;
		}

	.dxgvAdaptiveFooterPanel_Mulberry {
		border: solid 1px #d1d1d1;
		border-top-width: 0;
		padding-top: 6px;
	}

	.dxgvAdaptiveHeaderPanel_Mulberry,
	.dxgvAdaptiveFooterPanel_Mulberry {
		padding-left: 30px;
	}

	.dxgvFooter_Mulberry {
		white-space: nowrap;
	}

		.dxgvFooter_Mulberry td.dxgv {
			padding: 14px 10px;
			border-right-width: 0px;
			border-bottom: 1px Solid #cbcbcb !important;
		}

	.dxgvABRL .dxgvFooter_Mulberry td.dxgv,
	.dxgvABRL .dxgvGroupFooter_Mulberry td.dxgv {
		border-right: 1px Solid #cbcbcb;
	}

	.dxgvFSDC .dxgvFooter_Mulberry td.dxgv,
	.dxgvCSD .dxgvFooter_Mulberry td.dxgv {
		border-bottom: 0 !important;
	}

	.dxgvGroupFooter_Mulberry td.dxgv {
		padding: 5px 10px 6px;
		border-bottom: 1px Solid #cbcbcb;
		border-right-width: 0px;
	}

	.dxgvDataRow_Mulberry td.dxgvIndentCell,
	.dxgvDetailRow_Mulberry td.dxgvIndentCell,
	.dxgvPreviewRow_Mulberry td.dxgvIndentCell,
	.dxgvGroupRow_Mulberry td.dxgvIndentCell,
	.dxgvGroupFooter_Mulberry td.dxgvIndentCell {
		background-color: white;
		border-top-width: 0px;
		border-right: 1px Solid #cbcbcb;
		border-left: 1px Solid #cbcbcb;
	}

	.dxgvTitlePanel_Mulberry,
	.dxgvTable_Mulberry caption {
		font-weight: normal;
		padding: 6px 5px 7px;
		text-align: center;
	}

	.dxgvLoadingDiv_Mulberry {
		background-color: Gray;
		opacity: 0.01;
		filter: progid:DXImageTransform.Microsoft.Alpha(Style=0, Opacity=1);
	}

	.dxgvPagerBottomPanel_Mulberry + .dxgvStatusBar_Mulberry {
		border-top: 1px Solid #cbcbcb;
	}

	.dxgvStatusBar_Mulberry tr.dxgv {
		height: 20px;
	}

		.dxgvStatusBar_Mulberry tr.dxgv > td {
			padding: 13px 5px;
		}

		.dxgvStatusBar_Mulberry tr.dxgv span .dxbButtonSys:first-child {
			margin-left: 4px;
		}

	.dxgvCommandColumn_Mulberry a {
		margin: 0px 5px 0px 0px;
		vertical-align: middle;
	}

	.dxbButton_Mulberry[class~="dxgvCommandColumnItem_Mulberry"],
	.dxgvEditFormTable_Mulberry div.dxbButton_Mulberry {
		margin: -2px 2px;
	}

		.dxbButton_Mulberry[class~="dxgvCommandColumnItem_Mulberry"] .dxb {
			padding-top: 0;
			padding-bottom: 0;
		}

	.dxgvFilterRow_Mulberry a.dxgvCommandColumnItem_Mulberry {
		display: inline-block;
		margin-top: 1px;
	}

	.dxgvEditFormTable_Mulberry {
		margin: 10px 0px;
		padding: 0px;
	}

	.dxgvEditFormCaption_Mulberry {
		padding: 5px 4px 4px 8px;
		white-space: nowrap;
	}

	.dxgvInlineEditCell_Mulberry {
		padding: 4px;
	}

	.dxgvEditFormCell_Mulberry {
		padding: 4px;
		border-width: 0;
	}

	.dxgvFilterBar_Mulberry {
		border-top: 1px solid #cbcbcb;
	}

		.dxgvFilterBar_Mulberry a {
			color: #5e6d9d;
			text-decoration: underline;
		}

			.dxgvFilterBar_Mulberry a:hover {
				color: #343434;
			}

	.dxgvFilterBarCheckBoxCell_Mulberry {
		padding: 0 5px 0 1px;
	}

	.dxgvFilterBarImageCell_Mulberry {
		padding: 0 1px 0 3px;
		cursor: pointer;
	}

	.dxgvFilterBarExpressionCell_Mulberry {
		padding: 6px 5px 8px 0;
		white-space: nowrap;
	}

	.dxgvFilterBarClearButtonCell_Mulberry {
		padding: 5px 6px 8px;
	}

	.dxgvFilterBuilderMainArea_Mulberry {
		background: white none;
		padding: 6px 2px;
	}

	.dxgvFilterBuilderButtonArea_Mulberry {
		background-color: white;
		border-top: 1px solid #cbcbcb;
		padding: 12px;
		white-space: nowrap;
	}

	.dxgvPagerBottomPanel_Mulberry,
	.dxgvPagerTopPanel_Mulberry {
		padding: 2px 0;
	}

	.dxgvDataRowHover_Mulberry {
		background-color: #f1f2f5;
		color: #343434;
	}

	.dxgvControl_Mulberry .dxpLite_Mulberry {
		padding: 6px 0 6px 6px;
	}

	.dxgvControl_Mulberry .dxgvHFSAC {
		padding: 6px 0 0 3px;
	}

	.dxgvControl_Mulberry .dxgvHFC {
		padding-left: 3px;
		padding-bottom: 3px;
	}

		.dxgvControl_Mulberry .dxgvHFC .dxeCalendar_Mulberry {
			margin-top: 3px;
			margin-left: 32px;
		}

	.dxgvControl_Mulberry .dxgvHFSC {
		padding: 6px 0 2px;
	}

		.dxgvControl_Mulberry .dxgvHFSC div {
			height: 1px;
			background: #ececec;
		}

	.dxgvControl_Mulberry div[id$='DXEPLPC'] {
		height: 88px;
	}

	.dxgvControl_Mulberry .dxgvHFSD {
		height: 1px;
		margin: 2px 0;
	}

	.dxgvControl_Mulberry .dxgvHFDRC {
		margin: 20px 15px 30px;
	}

	.dxgvControl_Mulberry .dxgvHFDRP {
		margin-left: 15px;
		margin-right: 15px;
		padding: 9px 0 6px;
	}

		.dxgvControl_Mulberry .dxgvHFDRP[id*="HFFDE"] {
			margin-top: 20px;
			margin-bottom: 10px;
		}

		.dxgvControl_Mulberry .dxgvHFDRP[id*="HFTDE"] {
			margin-bottom: 30px;
		}
	/* Removes flicking in iOS Safari*/
	.dxgvTable_Mulberry {
		-webkit-tap-highlight-color: transparent;
	}

	.dxgvControl_Mulberry td.dxgvBatchEditCell_Mulberry {
		padding: 0;
	}

	.dxgvControl_Mulberry td.dxgvBatchEditModifiedCell_Mulberry {
		background: #d7f9c7;
	}

	.dxgvBatchEditDeletedItem_Mulberry,
	.dxgvBatchEditNewItem_Mulberry.dxgvBatchEditDeletedItem_Mulberry {
		background: #EFEFEF;
	}

		.dxgvBatchEditDeletedItem_Mulberry > td:not(.dxgvCommandColumn_Mulberry) {
			color: rgba(0,0,0,0.5);
		}

		.dxgvBatchEditDeletedItem_Mulberry td.dxgvBatchEditModifiedCell_Mulberry {
			background: #eefbe7;
		}

	.dxgvBatchEditNewItem_Mulberry {
		background: #F0FAEA;
	}

	.dxgvControl_Mulberry .dxgvErrorCell {
		padding-left: 5px;
		width: 1px;
	}

		.dxgvControl_Mulberry .dxgvErrorCell img {
			margin: -2px 0;
		}

	.dxgvStatusBar_Mulberry .dxgvCommandColumn_Mulberry a {
		margin-right: 10px;
	}

	.dxgvControl_Mulberry td.dxgvBatchEditCell_Mulberry .dxichCellSys {
		padding-left: 0;
	}

	.dxgvSearchPanel_Mulberry {
		padding: 14px 0;
	}

		.dxgvSearchPanel_Mulberry > table {
			width: 70%;
			max-width: 650px;
		}

	.dxgvControl_Mulberry .dxgvSearchPanel_Mulberry .dxbButton_Mulberry {
		margin-left: 7px;
		margin-right: 0;
	}

	*[dir="rtl"].dxgvControl_Mulberry .dxgvSearchPanel_Mulberry .dxbButton_Mulberry {
		margin-left: 0;
		margin-right: 7px;
	}

	.dxgvControl_Mulberry .dxgvHL {
		background: #ffd83a;
		color: #333333;
		font-weight: bold;
		font-style: normal;
	}
	/* TODO remove (replace to command button style) */
	.dxgvControl_Mulberry .dxgvSearchPanel_Mulberry .dxbButton_Mulberry {
		font-size: 0.9em;
		margin-top: -2px;
		margin-bottom: -2px;
	}

		.dxgvControl_Mulberry .dxgvSearchPanel_Mulberry .dxbButton_Mulberry .dxb {
			padding-top: 0;
			padding-bottom: 0;
		}

	.dxgvFocusedCell_Mulberry {
		box-shadow: inset 2px 2px 0 #2292B1, inset -2px -2px 0 #2292B1;
		-webkit-box-shadow: inset 2px 2px 0 #2292B1, inset -2px -2px 0 #2292B1;
		-moz-box-shadow: inset 2px 2px 0 #2292B1, inset -2px -2px 0 #2292B1;
	}
	/* Customization Dialog */
	.dxgvControl_Mulberry .dxgvCD_M {
		background-color: #777777;
		opacity: 0.7;
	}

	.dxgvCustDialog_Mulberry {
		font-size: 15px;
		font-weight: 400;
		background-color: White;
	}

	.dxgvCustDialogHeader_Mulberry {
		padding-top: 11px;
		margin-bottom: 8px;
		border-bottom: 1px solid #CBCBCB;
	}

		.dxgvCustDialogHeader_Mulberry > div {
			display: table-cell;
		}

			.dxgvCustDialogHeader_Mulberry > div:first-child,
			.dxgvCustDialogHeader_Mulberry > div:last-child {
				vertical-align: top;
			}

			.dxgvCustDialogHeader_Mulberry > div:first-child {
				padding-left: 11px;
			}

			.dxgvCustDialogHeader_Mulberry > div:last-child {
				padding-right: 11px;
			}

		.dxgvCustDialogHeader_Mulberry a.dxbButton_Mulberry {
			padding: 10px 10px 6px 10px;
		}

		.dxgvCustDialogHeader_Mulberry .dxgvCD_TSC {
			vertical-align: bottom;
			padding: 0;
			width: 100%;
		}

		.dxgvCustDialogHeader_Mulberry .dxgvCD_TS {
			overflow: hidden;
			position: relative;
			padding: 0;
			text-align: center;
			margin-bottom: -1px;
		}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxgvCD_TSBW {
				overflow: hidden;
				padding: 0 16px;
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top > .dxtc-stripContainer .dxtc-tab,
			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top > .dxtc-stripContainer .dxtc-activeTab {
				font-size: 14px;
				/*padding-top: 3px;
	padding-bottom: 2px;*/
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top > .dxtc-stripContainer .dxtc-last {
				margin-right: 16px;
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top[dir="rtl"] > .dxtc-stripContainer .dxtc-last {
				margin-left: 16px;
				margin-right: 0;
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top > .dxtc-stripContainer .dxtc-leftIndent,
			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxtcLite_Mulberry.dxtc-top > .dxtc-stripContainer .dxtc-rightIndent {
				display: none;
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxgvCD_TSLS,
			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxgvCD_TSRS {
				position: absolute;
				top: -1px;
				width: 16px;
				height: 100%;
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxgvCD_TSLS {
				left: 0;
				background: linear-gradient(to right, white, rgba(255,255,255,0));
			}

			.dxgvCustDialogHeader_Mulberry .dxgvCD_TS .dxgvCD_TSRS {
				right: 0;
				background: linear-gradient(to left, white, rgba(255,255,255,0));
			}

	.dxgvCustDialogDragArea_Mulberry {
		padding-bottom: 16px !important;
	}

	.dxgvCustDialogDragArea_Mulberry,
	.dxgvCustDialogFilteringPage_Mulberry {
		padding: 0;
	}

	.dxgvCustDialogSortingPage_Mulberry .dxgvCustDialogDragArea_Mulberry,
	.dxgvCustDialogGroupingPage_Mulberry .dxgvCustDialogDragArea_Mulberry {
		padding: 0 0 16px 0;
		min-height: 49px;
	}

	.dxgvCustDialogDragArea_Mulberry .dxgvCD_DAETC {
		color: #999999;
		font-size: 13px;
		text-align: center;
		white-space: nowrap;
		padding-top: 24px;
	}

	.dxgvCustDialogListArea_Mulberry .dxgvCD_LAC {
		color: #666666;
		font-weight: bold;
		padding: 14px 0 8px 15px;
		border-bottom: 1px solid #DCDCDC;
	}

	.dxgvControl_Mulberry[dir="rtl"] .dxgvCustDialogListArea_Mulberry .dxgvCD_LAC {
		padding-left: 0;
		padding-right: 15px;
	}

	.dxgvCustDialogListArea_Mulberry .dxgvCD_LAIW {
		padding-left: 4px;
	}

	.dxgvCustDialogColumnItem_Mulberry {
		background-color: #FFFFFF;
		color: rgba(0,0,0,0.64);
		min-height: 48px;
		transition: all 0.2s;
	}

		.dxgvCustDialogColumnItem_Mulberry > div {
			display: table-cell;
			padding: 10px;
			vertical-align: middle;
		}

			.dxgvCustDialogColumnItem_Mulberry > div:first-child {
				padding-left: 18px;
			}

			.dxgvCustDialogColumnItem_Mulberry > div:last-child {
				padding-right: 21px;
			}

	.dxgvCustDialogListArea_Mulberry .dxgvCustDialogColumnItem_Mulberry > div:first-child {
		padding-left: 10px;
	}

	.dxgvCustDialogColumnItem_Mulberry div img {
		vertical-align: middle;
	}

	.dxgvCustDialogDragArea_Mulberry .dxgvCustDialogColumnItem_Mulberry {
		border-bottom: 1px solid #DCDCDC;
	}

		.dxgvCustDialogDragArea_Mulberry .dxgvCustDialogColumnItem_Mulberry > div:first-child {
			height: 48px;
			padding: 0;
			padding-left: 8px;
			text-align: center;
			min-width: 28px;
		}

		.dxgvCustDialogDragArea_Mulberry .dxgvCustDialogColumnItem_Mulberry div:last-child,
		.dxgvCustDialogListArea_Mulberry .dxgvCustDialogColumnItem_Mulberry div:last-child {
			height: 48px;
			padding-top: 0;
			padding-bottom: 0;
		}

		.dxgvCustDialogDragArea_Mulberry .dxgvCustDialogColumnItem_Mulberry.DXCODraggingItem {
			transition: none;
			position: relative;
			box-shadow: 0 10px 0.25rem rgba(0,0,0,0.12), 0 0.25rem 0.5rem rgba(0,0,0,0.24);
			z-index: 1;
		}

	.dxgvCustDialogSortingPage_Mulberry .dxgvCD_DAW,
	.dxgvCustDialogGroupingPage_Mulberry .dxgvCD_DAW {
		position: relative;
	}

	.dxgvCustDialogSortingPage_Mulberry .dxgvCD_DAEB,
	.dxgvCustDialogGroupingPage_Mulberry .dxgvCD_DAEB {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 38px;
		background: #EFEFEF;
		box-shadow: 0px -3px 5px 0px rgba(0,0,0,0.11);
		cursor: pointer;
		text-align: center;
	}

		.dxgvCustDialogSortingPage_Mulberry .dxgvCD_DAEB img,
		.dxgvCustDialogGroupingPage_Mulberry .dxgvCD_DAEB img {
			margin-top: 14px;
		}

	.dxgvCustDialogFilteringPage_Mulberry {
		background: #EFEFEF;
	}

		.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry,
		.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogFilterItem_Mulberry {
			transition: none;
			border-bottom: 1px solid #DCDCDC;
		}

			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry.dxgvCD_EFCI,
			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry.dxgvCD_EFCI + .dxgvCustDialogFilterItem_Mulberry + .dxgvCustDialogColumnItem_Mulberry {
				border-top: 1px solid #DCDCDC;
			}

			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry:first-child {
				border-top: none;
			}

			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry > div {
				height: 28px;
			}

				.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogColumnItem_Mulberry > div:first-child {
					padding-left: 10px;
				}

			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogFilterItem_Mulberry a {
				cursor: pointer;
			}

			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogFilterItem_Mulberry a,
			.dxgvCustDialogFilteringPage_Mulberry .dxgvCustDialogFilterItem_Mulberry .dxgvCD_FR > span.dxeBase_Mulberry {
				font-size: medium;
				line-height: 50px;
			}

	.dxgvCustDialogFilterItem_Mulberry {
		margin-bottom: 17px;
		background: white;
	}

		.dxgvCustDialogFilterItem_Mulberry + .dxgvCustDialogColumnItem_Mulberry.dxgvCD_EFCI {
			margin-top: 17px;
		}

	.dxgvCustDialogColumnItem_Mulberry + .dxgvCustDialogFilterItem_Mulberry {
		display: none;
	}

	.dxgvCustDialogColumnItem_Mulberry.dxgvCD_EFCI + .dxgvCustDialogFilterItem_Mulberry {
		display: block;
	}

	.dxgvCustDialogFilterItem_Mulberry .dxgvCD_FR {
		padding: 0 10px 18px 10px;
	}

	.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_UF {
		text-align: center;
		vertical-align: middle;
	}

		.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_UF a {
			text-transform: uppercase;
		}

	.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_FR + .dxgvCD_UF {
		border-top: 1px solid #DCDCDC;
	}

	.dxgvCustDialogFilterItem_Mulberry .dxgvCD_UF.dxgvCD_UFLBV {
		border-bottom: 1px solid #DCDCDC;
	}

	.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_UF.dxgvCD_UFLBV a,
	.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_UFSC {
		display: none;
	}

	.dxgvCustDialogFilteringPage_Mulberry .dxgvCD_UF.dxgvCD_UFLBV .dxgvCD_UFSC {
		display: block;
	}

	.dxgvCustDialogFilterItem_Mulberry .dxgvCD_UF.dxgvCD_UFLBV {
		margin-bottom: 19px;
	}

	.dxgvCustDialogFilterItem_Mulberry .dxgvCD_UFSC {
		overflow-x: hidden;
		overflow-y: auto;
		width: 100%;
		height: 200px;
	}
</style>
<div id="box1" style="display: block;">
	<dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdating="Edycja" DataSourceID="uprawniewnia" EnableRowsCache="False">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>

			<CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>
		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="uprawniewnia" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, nazwa, CASE WHEN (SELECT COUNT(*) AS uprawnienia FROM uprawnienia WHERE rodzaj = 1 and (id_uzytkownika = @uzytkownika) AND (id_wydzialu = wydzialy.ident)) >= 1 THEN 1 ELSE 0 END AS uprawnienia FROM wydzialy order by nazwa" UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>

<div id="box2" style="display: none;">
	<dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdating="EdycjaKontrolki" DataSourceID="uprawniewniaKontrolki" EnableRowsCache="False">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>


			<CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="uprawniewniaKontrolki" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, opis AS nazwa, CASE WHEN                    (SELECT COUNT(*) AS uprawnienia                     FROM   uprawnienia                     WHERE rodzaj = 3 AND (id_uzytkownika = @uzytkownika) AND (id_wydzialu = konfig.ident)) >= 1 THEN 1 ELSE 0 END AS uprawnienia  FROM  konfig WHERE (klucz = 'kontrolka') order by nazwa" UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>

<div id="box3" style="display: none;">
	<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdating="EdycjaMSS" DataSourceID="SqlDataSource1" EnableRowsCache="False">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>


			<CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="ZapiszAA">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, nazwa, CASE WHEN (SELECT COUNT(*) AS uprawnienia FROM uprawnienia WHERE (id_uzytkownika = @uzytkownika) AND  rodzaj=2 and (id_wydzialu = wydzialy_mss.ident)) >= 1 THEN 1 ELSE 0 END AS uprawnienia FROM wydzialy_mss order by nazwa" UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>

<div id="box4" style="display: none;">
	<dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdated="PoEdycji" OnRowUpdating="EdycjaKof" OnStartRowEditing="startEdycji" DataSourceID="uprawniewniaKOF" EnableRowsCache="False">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>

		  
			<CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="3" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="4" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="2" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="uprawniewniaKOF" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, opis AS nazwa, CASE WHEN
				   (SELECT COUNT(*) AS uprawnienia
					FROM   uprawnienia
					WHERE rodzaj = 4 AND (id_uzytkownika = @uzytkownika) AND (id_wydzialu = konfig.ident)) &gt;= 1 THEN 1 ELSE 0 END AS uprawnienia
FROM  konfig
WHERE (klucz = 'kof') order by nazwa"
		UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>

<div id="box5" style="display: none;">
	<dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdated="PoEdycji" OnRowUpdating="EdycjaWyszukiwarki" OnStartRowEditing="startEdycji" DataSourceID="uprawniewniaWyszukiwarka" EnableRowsCache="False">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>

		
			<CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="uprawniewniaWyszukiwarka" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, opis AS nazwa, CASE WHEN
				   (SELECT COUNT(*) AS uprawnienia
					FROM   uprawnienia
					WHERE rodzaj = 5 AND (id_uzytkownika = @uzytkownika) AND (id_wydzialu = konfig.ident)) &gt;= 1 THEN 1 ELSE 0 END AS uprawnienia
FROM  konfig
WHERE (klucz = 'wyszukiwarka') order by nazwa"
		UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>

<div id="box6" style="display: none;">
	<dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdating="EdycjaPracownika" OnStartRowEditing="startEdycji" DataSourceID="uprawniewniaPracownik">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>
 <CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>

	<asp:SqlDataSource ID="uprawniewniaPracownik" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, opis AS nazwa, CASE WHEN
				   (SELECT COUNT(*) AS uprawnienia FROM   uprawnienia WHERE rodzaj = 6 AND (id_uzytkownika = @uzytkownika) AND (id_wydzialu = konfig.ident)) &gt;= 1 THEN 1 ELSE 0 END AS uprawnienia FROM  konfig WHERE (klucz = 'pracownik') order by nazwa"
		UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>
<div id="box7" style="display: block;">
	
	
	
	<dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" KeyFieldName="ident" Theme="Mulberry" EnableTheming="True" OnRowUpdating="EdycjaPracownika" OnStartRowEditing="startEdycji" DataSourceID="UprawnieniaWymiana">
		<Settings ShowFilterRow="True" />
		<SettingsCommandButton>
 <CancelButton Text="Anuluj" Styles-Style-CssClass="butn1">
				<Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</CancelButton>
			<UpdateButton Text="Zapisz">
				 <Styles>
					<Style CssClass="butn1"></Style>
				</Styles>
			</UpdateButton>
		</SettingsCommandButton>
		<SettingsPager PageSize="30">
		</SettingsPager>

		<SettingsEditing Mode="Batch">
		</SettingsEditing>
		<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
		<Columns>
			<dx:GridViewCommandColumn VisibleIndex="0" Width="0px" Visible="False">
			</dx:GridViewCommandColumn>

			<dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="3" Width="400px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="uprawnienia" VisibleIndex="1" Width="200px">
			</dx:GridViewDataCheckColumn>
		</Columns>
		<Styles>
			<AlternatingRow BackColor="#CCCCCC">
			</AlternatingRow>
		</Styles>
	</dx:ASPxGridView>



	<asp:SqlDataSource ID="UprawnieniaWymiana" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ident, opis AS nazwa, CASE WHEN
				   (SELECT COUNT(*) AS uprawnienia FROM   uprawnienia WHERE rodzaj = 7 AND (id_uzytkownika = @uzytkownika) AND (id_wydzialu = konfig.ident)) &gt;= 1 THEN 1 ELSE 0 END AS uprawnienia FROM  konfig WHERE (klucz = 'wymiana') order by nazwa"
		UpdateCommand="UPDATE wydzialy SET nazwa= ''  WHERE (nazwa IS NULL) ">
		<SelectParameters>
			<asp:SessionParameter Name="uzytkownika" SessionField="identyfikatorUzytkownika" />
		</SelectParameters>
	</asp:SqlDataSource>

	<br />
</div>