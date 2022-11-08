<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="agl.aspx.cs" Inherits="Statystyki_2018.agl" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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

    <div id="menu" class="manu_back noprint" style="height: 40px;">

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

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px; z-index: 11;" >

        <div id="tabela1" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
        </div>

        <div id="TABELA1" class="page-break">
            <br />
            <asp:Label ID="lbTabela1" runat="server"></asp:Label>

            <asp:Label ID="infoLabel1" runat="server" Text="     Tabela 1 \/" Visible="False"></asp:Label>
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3">Miesiąc</td>
                    <td class="borderAll center" colspan="36">Repertorium</td>
                    <td class="borderAll center" colspan="6">Sprawy stare</td>
                    <td class="borderAll center" rowspan="3">wielo-krotna</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">C</td>
                    <td class="borderAll center" colspan="4">RC</td>
                    <td class="borderAll center" colspan="4">RAZEM</td>
                    <td class="borderAll center" colspan="4">Cgg</td>
                    <td class="borderAll center" colspan="4">Ns</td>
                    <td class="borderAll center" colspan="4">Co</td>
                    <td class="borderAll center" colspan="4">Nc</td>
                    <td class="borderAll center" colspan="4">Ns-rej</td>
                    <td class="borderAll center" colspan="4">Ogółem</td>
                    <td class="borderAll center" rowspan="2">pow 3-6</td>
                    <td class="borderAll center" rowspan="2">pow 6-12</td>
                    <td class="borderAll center" rowspan="2">pow 12-24</td>
                    <td class="borderAll center" rowspan="2">pow 24-36</td>
                    <td class="borderAll center" rowspan="2">pow 36-60</td>
                    <td class="borderAll center" rowspan="2">pow 60</td>
                </tr>
                <tr>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                </tr>
                <tr>
                    <td class="borderAll center">styczeń</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">luty</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">marzec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">kwiecień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">maj</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">czerwiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">lipiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c36" runat="server" Text="0"></asp:Label></a></td>
                    
                </tr>
                <tr>
                    <td class="borderAll center">sierpień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">wrzesień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">październik</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">listopad</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!37!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!38!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!39!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!40!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!41!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!42!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!43!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c43" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!8!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!9!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!10!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!11!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!12!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!13!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!14!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!15!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!16!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!17!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!18!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!19!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!20!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!21!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!22!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!23!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!24!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!25!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!26!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!27!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!28!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!29!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!30!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!31!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!32!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!33!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!34!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!35!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!36!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c36" runat="server" Text="0"></asp:Label></a></td>

                    <tr>
                        <td class="borderAll center">grudzień</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!13!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c13" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!14!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c14" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!15!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c15" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!16!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c16" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!17!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c17" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!18!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c18" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!19!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c19" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!20!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c20" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!21!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c21" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!22!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c22" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!23!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c23" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!24!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c24" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!25!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c25" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!26!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c26" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!27!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c27" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!28!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c28" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!29!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c29" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!30!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c30" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!31!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c31" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!32!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c32" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!33!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c33" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!34!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c34" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!35!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c35" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!36!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c36" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!37!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c37" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!38!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c38" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!39!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c39" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!40!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c40" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!41!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c41" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!42!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c42" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!1!43!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w23_c43" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">narastająco</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!13!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c13" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!14!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c14" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!15!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c15" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!16!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c16" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!17!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c17" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!18!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c18" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!19!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c19" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!20!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c20" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!21!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c21" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!22!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c22" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!23!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c23" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!24!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c24" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!25!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c25" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!26!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c26" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!27!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c27" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!28!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c28" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!29!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c29" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!30!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c30" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!31!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c31" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!32!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c32" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!33!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c33" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!34!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c34" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!35!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c35" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!1!36!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w24_c36" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
            </table>
        </div>

        <div id="Tabela2" class="page-break">
            <asp:Label ID="lbTabela2" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel2" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3">Miesiąc</td>
                    <td class="borderAll center" colspan="36">Repertorium</td>
                    <td class="borderAll center" colspan="5">Sprawy stare</td>
                    <td class="borderAll center" rowspan="3">wielo-<br />
                        krotna </td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">Ca</td>
                    <td class="borderAll center" colspan="4">Cagg</td>
                    <td class="borderAll center" colspan="4">Cz</td>
                    <td class="borderAll center" colspan="4">Czgg</td>
                    <td class="borderAll center" colspan="4">WSC</td>
                    <td class="borderAll center" colspan="4">WSC skarga o stw. niezg. z praw.</td>
                    <td class="borderAll center" colspan="4">S</td>
                    <td class="borderAll center" colspan="4">Co</td>
                    <td class="borderAll center" colspan="4">Razem</td>
                    <td class="borderAll center" rowspan="2">pow 3-6</td>
                    <td class="borderAll center" rowspan="2">pow 6-12</td>
                    <td class="borderAll center" rowspan="2">pow 12-24</td>
                    <td class="borderAll center" rowspan="2">pow 24-36</td>
                    <td class="borderAll center" rowspan="2">pow 36</td>
                </tr>
                <tr>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                </tr>
                <tr>
                    <td class="borderAll center">styczeń</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w01_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w02_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">luty</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w03_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w04_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">marzec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w05_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w06_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">kwiecień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w07_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w08_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">maj</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w09_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w10_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">czerwiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w11_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w12_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">lipiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w13_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w14_c36" runat="server" Text="0"></asp:Label></a></td>
                    <
                </tr>
                <tr>
                    <td class="borderAll center">sierpień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w15_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w16_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">wrzesień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w17_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w18_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">październik</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w19_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w20_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">listopad</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!37!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!38!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!39!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!40!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!41!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!2!42!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w21_c42" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!1!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!2!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!3!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!4!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!5!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!6!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!7!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!8!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!9!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!10!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!11!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!12!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!13!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!14!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!15!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!16!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!17!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!18!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!19!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!20!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!21!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!22!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!23!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!24!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!25!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!26!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!27!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!28!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!29!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!30!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!31!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!32!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!33!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!34!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!35!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!2!36!3')">
                            <asp:Label CssClass="normal" ID="tab_2_w22_c36" runat="server" Text="0"></asp:Label></a></td>

                    <tr>
                        <td class="borderAll center">grudzień</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!1!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!2!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!3!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!4!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!5!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!6!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!7!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!8!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!9!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!10!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!11!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!12!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!13!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c13" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!14!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c14" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!15!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c15" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!16!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c16" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!17!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c17" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!18!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c18" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!19!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c19" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!20!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c20" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!21!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c21" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!22!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c22" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!23!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c23" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!24!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c24" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!25!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c25" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!26!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c26" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!27!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c27" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!28!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c28" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!29!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c29" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!30!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c30" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!31!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c31" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!32!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c32" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!33!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c33" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!34!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c34" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!35!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c35" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!36!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c36" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!37!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c37" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!38!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c38" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!39!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c39" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!40!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c40" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!41!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c41" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!2!42!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w23_c42" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">narastająco</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!1!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!2!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!3!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!4!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!5!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!6!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!7!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!8!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!9!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!10!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!11!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!12!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!13!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c13" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!14!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c14" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!15!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c15" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!16!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c16" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!17!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c17" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!18!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c18" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!19!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c19" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!20!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c20" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!21!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c21" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!22!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c22" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!23!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c23" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!24!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c24" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!25!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c25" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!26!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c26" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!27!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c27" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!28!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c28" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!29!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c29" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!30!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c30" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!31!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c31" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!32!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c32" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!33!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c33" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!34!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c34" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!35!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c35" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!2!36!3')">
                                <asp:Label CssClass="normal" ID="tab_2_w24_c36" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
            </table>
            <br />
        </div>
        <div id="tabela3" class="page-break">
            <asp:Label ID="lbTabela3" runat="server"></asp:Label>
            <asp:Label ID="infoLabel3" runat="server" Text="            Tabela 3 \/" Visible="False"></asp:Label>
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3">Miesiąc</td>
                    <td class="borderAll center" colspan="12">Sąd Okręgowy w Gliwicach - Wydział Cywilny</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">Razem I instancja</td>
                    <td class="borderAll center" colspan="4">Razem II instancja</td>
                    <td class="borderAll center" colspan="4">Razem I i II instancja</td>
                </tr>
                <tr>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                </tr>
                <tr>
                    <td class="borderAll center">styczeń</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">luty</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">marzec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">kwiecień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">maj</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">czerwiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">lipiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                    
                </tr>
                <tr>
                    <td class="borderAll center">sierpień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">wrzesień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">październik</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">listopad</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!9!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!10!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!11!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!3!12!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w22_c12" runat="server" Text="0"></asp:Label></a></td>

                    <tr>
                        <td class="borderAll center">grudzień</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!1!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!2!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!3!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!4!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!5!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!6!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!7!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!8!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!9!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!10!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!11!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!3!12!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                    
                        <td class="borderAll center">narastająco</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!1!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!2!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!3!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!4!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!5!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!6!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!7!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!8!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!9!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!10!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!11!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!3!12!3')">
                                <asp:Label CssClass="normal" ID="tab_3_w24_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
            </table>

            <br />
        </div>
        <div id="Tabela4" class="page-break">
            &nbsp;<asp:Label ID="lbTabela4" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel4" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3">Miesiące</td>
                    <td class="borderAll center" colspan="49">Repertorium</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">GC</td>
                    <td class="borderAll center" colspan="4">GNc</td>
                    <td class="borderAll center" colspan="4">GNs</td>
                    <td class="borderAll center" colspan="4">GCo</td>
                    <td class="borderAll center" colspan="4">Ga</td>
                    <td class="borderAll center" colspan="4">Gz</td>
                    <td class="borderAll center" colspan="4">GS</td>
                    <td class="borderAll center" colspan="4">WSC skarga kasacyjna</td>
                    <td class="borderAll center" colspan="4">WSC skarga no</td>
                    <td class="borderAll center" colspan="4">Gu</td>
                    <td class="borderAll center" colspan="4">Razem</td>
                    <td class="borderAll center" rowspan="2">pow
      <br />
                        3-6</td>
                    <td class="borderAll center" rowspan="2">pow
      <br />
                        6-12</td>
                    <td class="borderAll center" rowspan="2">pow
      <br />
                        12-24</td>
                    <td class="borderAll center" rowspan="2">pow 24</td>
                    <td class="borderAll center" rowspan="2">wielo-<br />
                        krotna</td>
                </tr>
                <tr>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                </tr>
                <tr>
                    <td class="borderAll center">styczeń.</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c41" runat="server" Text="0"></asp:Label></a></td>

                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">luty</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">marzec</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">kwiecień</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w08_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">maj</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w09_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w10_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">czerwiec</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w11_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w12_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">lipiec</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w13_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w14_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">sierpień</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w15_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w16_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">wrzesień</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w17_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w18_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">październik</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w19_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w20_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">listopad</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w21_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w22_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">grudzień</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c44" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!45!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c45" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!46!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c46" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!47!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c47" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!48!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c48" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!4!49!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w23_c49" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!9!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!10!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!11!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!12!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!13!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!14!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!15!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!16!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!17!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!18!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!19!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!20!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!21!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!22!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!23!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!24!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!25!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!26!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!27!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!28!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!29!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!30!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!31!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!32!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!33!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!34!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!35!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!36!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c36" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!37!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c37" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!38!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c38" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!39!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c39" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!40!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c40" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!41!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c41" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!42!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c42" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!43!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c43" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!4!44!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w24_c44" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="Tabela5" class="page-break">
            <asp:Label ID="lbTabela5" runat="server"></asp:Label>
            <asp:Label ID="idlabel5" runat="server" Text="          Tabela 5 \/" Visible="False"></asp:Label>

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3">Miesiąc</td>
                    <td class="borderAll center" colspan="4" rowspan="2">Ogółem</td>
                    <td class="borderAll center" colspan="6">Sprawy stare</td>
                </tr>
                <tr>
                    <td class="borderAll center" rowspan="2">pow 3-6</td>
                    <td class="borderAll center" rowspan="2">pow 6-12</td>
                    <td class="borderAll center" rowspan="2">pow 12-24</td>
                    <td class="borderAll center" rowspan="2">pow 24-36</td>
                    <td class="borderAll center" rowspan="2">pow 36-60</td>
                    <td class="borderAll center" rowspan="2">pow 60</td>
                </tr>
                <tr>
                    <td class="borderAll center">poz.</td>
                    <td class="borderAll center">wpł.</td>
                    <td class="borderAll center">zał</td>
                    <td class="borderAll center">poz.</td>
                </tr>
                <tr>
                    <td class="borderAll center">styczeń</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">luty</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">marzec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">kwiecień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">maj</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">czerwiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">lipiec</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    
                </tr>
                <tr>
                    <td class="borderAll center">sierpień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">wrzesień</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">październik</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">listopad</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!9!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!5!10!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">narastająco</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_5_w22_c04" runat="server" Text="0"></asp:Label></a></td>

                    <tr>
                        <td class="borderAll center">grudzień</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!1!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!2!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!3!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!4!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!5!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!6!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!7!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!8!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!9!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center" rowspan="2">
                            <a href="javascript: openPopup('popup.aspx?sesja=23!5!10!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">narastająco</td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!5!1!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!5!2!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!5!3!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center">
                            <a href="javascript: openPopup('popup.aspx?sesja=24!5!4!3')">
                                <asp:Label CssClass="normal" ID="tab_5_w24_c04" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
            </table>
        </div>
        <br />

        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>

        <br />
    </div>
</asp:Content>