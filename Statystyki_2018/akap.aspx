<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="akap.aspx.cs" Inherits="Statystyki_2018.akap" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }
    </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
                <table>
                    <tr>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                              <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />

                        </td>

                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <br />
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;" >

        <div id="tabela1" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label CssClass="normal" ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label CssClass="normal" runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label CssClass="normal" ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label CssClass="normal" runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>

            <asp:Label CssClass="normal" ID="Label5" runat="server"></asp:Label>

            <br />
            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" colspan="3" valign="middle">
                        <asp:Label CssClass="normal" ID="Label713" runat="server" Text="Ewidencja spraw" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label></td>
                    <td></td>
                    <td align="center" colspan="11">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="3" rowspan="2" align="center" style="border-style: solid; border-width: medium thin medium medium; border-color: #000000;" valign="middle">
                        <asp:Label CssClass="normal" ID="Label52" runat="server" Text="Sprawy wg ksiąg"></asp:Label></td>
                    <td rowspan="2" style="border-style: solid; border-width: medium thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label55" runat="server" Text="l.p."></asp:Label></td>
                    <td align="center" colspan="4" style="border-style: solid; border-width: medium thin thin thin; border-color: #000000;">
                        <asp:Label CssClass="normal" ID="Label23" runat="server" Text="sprawy z zakresu"></asp:Label>
                        <br />
                        <asp:Label CssClass="normal" ID="Label739" runat="server" Text="ubezpieczeń społecznych"></asp:Label>
                    </td>
                    <td align="center" colspan="6" style="border-style: solid; border-width: medium thin thin thin; border-color: #000000;">
                        <asp:Label CssClass="normal" ID="Label60" runat="server" Text="Sprawy z zakresu"></asp:Label>
                        <br />
                        <asp:Label CssClass="normal" ID="Label81" runat="server" Text="prawa pracy"></asp:Label></td>
                    <td rowspan="2" style="border-style: solid; border-width: medium thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label86" runat="server" Text="OGÓŁEM (Pracy i Ubezp.)"></asp:Label></td>
                </tr>
                <tr>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label98" runat="server" Text="U"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label99" runat="server" Text="Uo"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label100" runat="server" Text="WSC"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label101" runat="server" Text="razem"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label102" runat="server" Text="P"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label103" runat="server" Text="Np"></asp:Label></td>
                    <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label104" runat="server" Text="Po"></asp:Label></td>
                    <td style="border-style: solid; border-width: medium thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label84" runat="server" Text="Wykaz Kas-z"></asp:Label></td>
                    <td style="border-style: solid; border-width: medium thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label740" runat="server" Text="WSC"></asp:Label></td>
                    <td style="border-style: solid; border-width: medium thin medium thin; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label741" runat="server" Text="razem"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label118" runat="server" Text="Pozostało z ubiegłego miesiąca"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="LB_11" runat="server" Text="1"></asp:Label></td>

                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_12" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_13" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_14" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_15" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_16" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_17" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_18" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_19" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_110" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_111" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_112" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td rowspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')">
                            <asp:Label CssClass="normal" ID="Label142" runat="server" Text="Wpłynęło"></asp:Label></td>
                    <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center"><strong>
                        <asp:Label CssClass="normal" ID="Label143" runat="server" Text="razem"></asp:Label></strong></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="LB_21" runat="server" Text="2"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_22" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_23" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_24" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_25" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_26" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_27" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_28" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_29" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_210" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_211" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_212" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td rowspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label167" runat="server" Text="w tym &lt;br/&gt;ponownie&lt;br/&gt; wpisane"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label168" runat="server" Text="ogółem"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label169" runat="server" Text="3"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_32" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_33" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_34" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_35" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_36" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_37" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_38" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_39" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_310" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_311" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_312" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label192" runat="server" Text="przekazane z&lt;br/&gt;innej jednostki"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label193" runat="server" Text="4"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_42" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_43" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_44" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_45" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_46" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_47" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_48" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_49" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_410" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_411" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_412" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td rowspan="2" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label226" runat="server" Text="załatwiono"></asp:Label></td>
                    <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label227" runat="server" Text="razem" Font-Bold="True"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label39" runat="server" Text="5"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_52" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_53" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_54" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_55" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_56" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_57" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_58" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_59" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_510" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_511" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_512" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label251" runat="server" Text="w tym przekazano &lt;br/&gt;do innej jednostki"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label253" runat="server" Text="6"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_62" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_63" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_64" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_65" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_66" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_67" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_68" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_69" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_610" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_611" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_612" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td rowspan="4" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label274" runat="server" Text="pozostało na &lt;br/&gt; następny m-c"></asp:Label></td>
                    <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label275" runat="server" Text="razem" Font-Bold="True"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label277" runat="server" Text="7"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_72" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_73" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_74" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_75" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_76" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_77" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_78" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_79" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_710" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_711" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_712" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td rowspan="3" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label299" runat="server" Text="w tym"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label300" runat="server" Text="pow. 3-6 m-cy"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label310" runat="server" Text="8"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_82" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_83" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_84" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_85" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_86" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_87" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_88" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_89" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_810" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_811" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_812" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label333" runat="server" Text="pow. 6-12 m-cy"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label334" runat="server" Text="9"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_92" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_93" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_94" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_95" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_96" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_97" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_98" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_99" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_910" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_911" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_912" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label357" runat="server" Text="pow. 12 m-cy"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label358" runat="server" Text="10"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_102" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_103" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_104" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_105" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_106" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_107" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_108" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_109" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_1010" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_1011" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_1012" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label379" runat="server" Text="liczba spraw zawieszonych"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label382" runat="server" Text="11"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_11_2" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_11_3" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_11_4" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_11_5" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_11_6" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_11_7" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_11_8" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_11_9" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_11_10" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_11_11" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_11_12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label412" runat="server" Text="wpływ od początku roku (narastająco)"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label415" runat="server" Text="12"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_122" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_123" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_124" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_125" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_126" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_127" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_128" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_129" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_1210" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_1211" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=12!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_1212" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label436" runat="server" Text="Przeciętny miesięczny wpływ &lt;br/&gt; (w. 12/ ilość miesięcy)"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label439" runat="server" Text="13"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_132" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_133" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_134" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_135" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_136" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_137" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_138" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_139" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_1310" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_1311" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=13!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_1312" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="3" style="border-style: solid; border-width: 0px 1px medium medium; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label460" runat="server" Text="Wskaźnik zaległości (w.7/13)"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000;" align="center">
                        <asp:Label CssClass="normal" ID="Label463" runat="server" Text="14"></asp:Label></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!1!3')">
                        <asp:Label CssClass="normal" ID="LB_142" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!2!3')">
                        <asp:Label CssClass="normal" ID="LB_143" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!3!3')">
                        <asp:Label CssClass="normal" ID="LB_144" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!4!3')">
                        <asp:Label CssClass="normal" ID="LB_145" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!5!3')">
                        <asp:Label CssClass="normal" ID="LB_146" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!6!3')">
                        <asp:Label CssClass="normal" ID="LB_147" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!7!3')">
                        <asp:Label CssClass="normal" ID="LB_148" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!8!3')">
                        <asp:Label CssClass="normal" ID="LB_149" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!9!3')">
                        <asp:Label CssClass="normal" ID="LB_1410" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!10!3')">
                        <asp:Label CssClass="normal" ID="LB_1411" runat="server" Text="0"></asp:Label></a></td>
                    <td style="border-style: solid; border-width: 0px 1px medium 1px; border-color: #000000; width: 56px;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=14!1!11!3')">
                        <asp:Label CssClass="normal" ID="LB_1412" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                OnRowCreated="GridView2_RowCreated" DataSourceID="dane_do_tabeli_1"
                Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15">
                <Columns>
                    <asp:TemplateField HeaderText="opis" SortExpression="opis">
                        <ItemTemplate>
                            <itemstyle cssclass="col_155" />
                            <asp:Label CssClass="normal" ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!1!1"%>')">
                                <asp:Label CssClass="normal" ID="Label11" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!2!1"%>')">
                                <asp:Label CssClass="normal" ID="Label12" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!3!1"%>')">
                                <asp:Label CssClass="normal" ID="Label13" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')">
                                <asp:Label CssClass="normal" ID="Label14" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')">
                                <asp:Label CssClass="normal" ID="Label15" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')">
                                <asp:Label CssClass="normal" ID="Label16" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')">
                                <asp:Label CssClass="normal" ID="Label17" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                        <ItemTemplate>

                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!8!1"%>')">
                                <asp:Label CssClass="normal" ID="Label18" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                        <ItemTemplate>

                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!9!1"%>')">
                                <asp:Label CssClass="normal" ID="Label19" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_103" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div id="zalatwienia" class="page-break">
            <br />

            <asp:Label CssClass="normal" ID="Label19" runat="server"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_2" OnRowCreated="GridView1_RowCreated"
                Width="100%" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label CssClass="normal" ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label CssClass="normal" ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label CssClass="normal" ID="Label201" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label CssClass="normal" ID="Label202" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label CssClass="normal" ID="Label203" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label CssClass="normal" ID="Label204" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label CssClass="normal" ID="Label205" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label CssClass="normal" ID="Label206" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label CssClass="normal" ID="Label207" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label CssClass="normal" ID="Label208" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label CssClass="normal" ID="Label209" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label CssClass="normal" ID="Label210" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label CssClass="normal" ID="Label211" runat="server" Text='<%# Eval("d_11")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label CssClass="normal" ID="Label212" runat="server" Text='<%# Eval("d_12")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label CssClass="normal" ID="Label213" runat="server" Text='<%# Eval("d_13")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label CssClass="normal" ID="Label214" runat="server" Text='<%# Eval("d_14")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label CssClass="normal" ID="Label215" runat="server" Text='<%# Eval("d_15")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label CssClass="normal" ID="Label216" runat="server" Text='<%# Eval("d_16")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_72" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="normal" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_2" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div id="wyznaczenia" class="page-break">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_3" OnRowCreated="GridView3_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label CssClass="normal" ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label CssClass="normal" ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t3_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label CssClass="normal" ID="Label301" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label CssClass="normal" ID="Label302" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label CssClass="normal" ID="Label303" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label CssClass="normal" ID="Label304" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label CssClass="normal" ID="Label305" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label CssClass="normal" ID="Label306" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label CssClass="normal" ID="Label307" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label CssClass="normal" ID="Label308" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label CssClass="normal" ID="Label309" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label CssClass="normal" ID="Label310" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_115" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="normal" HorizontalAlign="Center" />
                <RowStyle Height="25px" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_3" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <br />
        <div id="Div11" class="page-break">
            &nbsp;<asp:Label CssClass="normal" ID="Label15" runat="server"></asp:Label>
            &nbsp;<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_4" OnRowCreated="GridView4_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView4_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label CssClass="normal" ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label CssClass="normal" ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t4_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label CssClass="normal" ID="Label401" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label CssClass="normal" ID="Label402" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label CssClass="normal" ID="Label403" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label CssClass="normal" ID="Label404" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label CssClass="normal" ID="Label405" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label CssClass="normal" ID="Label406" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label CssClass="normal" ID="Label407" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label CssClass="normal" ID="Label408" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label CssClass="normal" ID="Label409" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label CssClass="normal" ID="Label410" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label CssClass="normal" ID="Label411" runat="server" Text='<%# Eval("d_11")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label CssClass="normal" ID="Label412" runat="server" Text='<%# Eval("d_12")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label CssClass="normal" ID="Label413" runat="server" Text='<%# Eval("d_13")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label CssClass="normal" ID="Label414" runat="server" Text='<%# Eval("d_14")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label CssClass="normal" ID="Label415" runat="server" Text='<%# Eval("d_15")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label CssClass="normal" ID="Label416" runat="server" Text='<%# Eval("d_16")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                <asp:Label CssClass="normal" ID="Label417" runat="server" Text='<%# Eval("d_17")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="normal" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_4" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24,d_25,d_26,d_27,d_28, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div id="Div11" class="page-break">
            &nbsp;<asp:Label CssClass="normal" ID="Label2" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False"
        DataSourceID="tabela_5" OnRowCreated="GridView5_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView5_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label CssClass="normal" ID="Label714" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label CssClass="normal" ID="Label715" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle CssClass="t4_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                        <asp:Label CssClass="normal" ID="Label716" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                        <asp:Label CssClass="normal" ID="Label717" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                        <asp:Label CssClass="normal" ID="Label718" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                        <asp:Label CssClass="normal" ID="Label719" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                        <asp:Label CssClass="normal" ID="Label720" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                        <asp:Label CssClass="normal" ID="Label721" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                        <asp:Label CssClass="normal" ID="Label722" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                        <asp:Label CssClass="normal" ID="Label723" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                        <asp:Label CssClass="normal" ID="Label724" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                        <asp:Label CssClass="normal" ID="Label725" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                        <asp:Label CssClass="normal" ID="Label726" runat="server" Text='<%# Eval("d_11")%>'></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="col_91" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="normal" HorizontalAlign="Center" />
    </asp:GridView>
            <asp:SqlDataSource ID="tabela_5" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 5) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div id="Div11" class="page-break">
            &nbsp;<asp:Label CssClass="normal" ID="Label8" runat="server"></asp:Label>
            &nbsp;<asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_6" OnRowCreated="GridView6_RowCreated1" Width="100%" ShowHeader="False" OnRowDataBound="GridView6_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label CssClass="normal" ID="Label714" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label CssClass="normal" ID="Label715" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t4_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label CssClass="normal" ID="Label716" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label CssClass="normal" ID="Label717" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label CssClass="normal" ID="Label718" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label CssClass="normal" ID="Label719" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label CssClass="normal" ID="Label720" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label CssClass="normal" ID="Label721" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label CssClass="normal" ID="Label722" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label CssClass="normal" ID="Label723" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label CssClass="normal" ID="Label724" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label CssClass="normal" ID="Label725" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label CssClass="normal" ID="Label726" runat="server" Text='<%# Eval("d_11")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label CssClass="normal" ID="Label727" runat="server" Text='<%# Eval("d_12")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label CssClass="normal" ID="Label728" runat="server" Text='<%# Eval("d_13")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label CssClass="normal" ID="Label729" runat="server" Text='<%# Eval("d_14")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label CssClass="normal" ID="Label730" runat="server" Text='<%# Eval("d_15")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label CssClass="normal" ID="Label731" runat="server" Text='<%# Eval("d_16")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                <asp:Label CssClass="normal" ID="Label732" runat="server" Text='<%# Eval("d_17")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                                <asp:Label CssClass="normal" ID="Label733" runat="server" Text='<%# Eval("d_18")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                                <asp:Label CssClass="normal" ID="Label734" runat="server" Text='<%# Eval("d_19")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')">
                                <asp:Label CssClass="normal" ID="Label735" runat="server" Text='<%# Eval("d_20")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')">
                                <asp:Label CssClass="normal" ID="Label736" runat="server" Text='<%# Eval("d_21")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!2"%>')">
                                <asp:Label CssClass="normal" ID="Label737" runat="server" Text='<%# Eval("d_22")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <asp:TextBox ID="TextBox30" runat="server" Text='<%# Eval("d_23") %>' Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="normal" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_6" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 6) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>

        <div id="Div11" class="page-break">
            &nbsp;<asp:Label CssClass="normal" ID="Label7" runat="server"></asp:Label>
            &nbsp;<asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_7" OnRowCreated="GridView7_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView7_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label CssClass="normal" ID="Label714" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label CssClass="normal" ID="Label715" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t4_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label CssClass="normal" ID="Label716" runat="server" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label CssClass="normal" ID="Label717" runat="server" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label CssClass="normal" ID="Label718" runat="server" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label CssClass="normal" ID="Label719" runat="server" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label CssClass="normal" ID="Label720" runat="server" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label CssClass="normal" ID="Label721" runat="server" Text='<%# Eval("d_06")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label CssClass="normal" ID="Label722" runat="server" Text='<%# Eval("d_07")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label CssClass="normal" ID="Label723" runat="server" Text='<%# Eval("d_08")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label CssClass="normal" ID="Label724" runat="server" Text='<%# Eval("d_09")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label CssClass="normal" ID="Label725" runat="server" Text='<%# Eval("d_10")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label CssClass="normal" ID="Label726" runat="server" Text='<%# Eval("d_11")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_91" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="normal" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_7" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 7) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>

        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                  <asp:Label CssClass="normal" ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
          <asp:Label CssClass="normal" ID="Label29" runat="server"></asp:Label>
            &nbsp;&nbsp;
          <asp:Label CssClass="normal" ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label CssClass="normal" ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label CssClass="normal" ID="Label11" runat="server"></asp:Label>
        </div>

        <br />
    </div>
</asp:Content>