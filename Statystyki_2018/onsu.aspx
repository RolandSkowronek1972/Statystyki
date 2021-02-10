<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onsu.aspx.cs" Inherits="Statystyki_2018.onsu" MaintainScrollPositionOnPostback="true" %>

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
    <script src="Scripts/jquery-1.8.3.js"></script>

    <script src="Scripts/rls.js"></script>

    <div id="menu" class="manu_back noprint" style="height: 40px;margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
             
              
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
                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcel">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">
        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>

            <asp:Label ID="Label5" runat="server"></asp:Label>
        </div>
        <div id="tabela1">
            <br />

            <div id="TABELA5" class="page-break">
                <table style="width: 100%;">
                    <tr>
                        <td class="col_180 borderAll" rowspan="2">Opis</td>
                        <td class="borderAll center" colspan="7">Sprawy według repetoriów i wykazów</td>
                    </tr>
                    <tr>
                        <td class="borderAll center">GU bez &#39;&#39;of&#39;&#39;</td>
                        <td class="borderAll center">CG-G</td>
                        <td class="borderAll center">GU &#39;&#39;of&#39;&#39;</td>
                        <td class="borderAll center">GU Razem</td>
                        <td class="borderAll center">GUp &#39;&#39;of&#39;&#39;</td>
                        <td class="borderAll center">WSC</td>
                        <td class="borderAll center">Łącznie</td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=9!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=10!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_180 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_100 borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=11!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>

                <br />
            </div>
            <div id="tabela2" class="page-break">
                <br />
                <asp:Label ID="Label15" runat="server"></asp:Label>
                <asp:GridView ID="Tabela_02" runat="server" OnRowCreated="naglowekTabeli_Tabela_02" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_Tabela_02" DataSourceID="" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                            <ItemStyle Width="15px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("stanowisko") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                    <asp:Label ID="Label_Tabela_02101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                    <asp:Label ID="Label_Tabela_02102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                    <asp:Label ID="Label_Tabela_02103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                    <asp:Label ID="Label_Tabela_02104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                    <asp:Label ID="Label_Tabela_02105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                    <asp:Label ID="Label_Tabela_02106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                    <asp:Label ID="Label_Tabela_02107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                    <asp:Label ID="Label_Tabela_02108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                    <asp:Label ID="Label_Tabela_02109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                    <asp:Label ID="Label_Tabela_02110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                    <asp:Label ID="Label_Tabela_02111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                    <asp:Label ID="Label_Tabela_02112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
            </div>

            <br />
            <div id="tabela3" class="page-break">
                <asp:Label ID="Label17" runat="server"></asp:Label>
                <asp:GridView ID="Tabela_03" runat="server" OnRowCreated="naglowekTabeli_Tabela_03" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_Tabela_03" DataSourceID="" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                            <ItemStyle Width="15px" />
                        </asp:BoundField>
                 
                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("stanowisko") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                    <asp:Label ID="Label_Tabela_03101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                    <asp:Label ID="Label_Tabela_03102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                    <asp:Label ID="Label_Tabela_03103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                    <asp:Label ID="Label_Tabela_03104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                    <asp:Label ID="Label_Tabela_03105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                    <asp:Label ID="Label_Tabela_03106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                    <asp:Label ID="Label_Tabela_03107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                    <asp:Label ID="Label_Tabela_03108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                     
                    </Columns>
                </asp:GridView>

                <br />
            </div>
            <div id="tabela4" class="page-break">

            <asp:Label ID="Label19" runat="server"></asp:Label>
                <br />
                <asp:GridView ID="Tabela_04" runat="server" OnRowCreated="naglowekTabeli_Tabela_04" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_Tabela_04" DataSourceID="" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                            <ItemStyle Width="15px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                              
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("stanowisko") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                    <asp:Label ID="Label_Tabela_04101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                    <asp:Label ID="Label_Tabela_04102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                    <asp:Label ID="Label_Tabela_04103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                    <asp:Label ID="Label_Tabela_04104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                    <asp:Label ID="Label_Tabela_04105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                    <asp:Label ID="Label_Tabela_04106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                    <asp:Label ID="Label_Tabela_04107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_50H " />
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
            

                <br />
            </div>

            <div id="Div8" class="page-break">
                <br />
                Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
                <br />
            </div>

            <br />
        </div>
    </div>
</asp:Content>