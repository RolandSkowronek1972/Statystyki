<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss19o.aspx.cs" Inherits="Statystyki_2018.mss19o" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
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

        .auto-style2 {
            height: 2px;
        }

        </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position: relative; width: 1150px; left: 0px;">

                <table class="tbl_manu">

                    <tr>
                        <td style="width: 90px;">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:Label ID="Label4" runat="server" Text="Zakres:"></asp:Label>
                        </td>
                        <td style="width: 80px;">

                            <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 80px;">
                            <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno" AutoResizeWithContainer="True" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>

                        <td>Id. raportu</td>
                        <td>

                            <asp:TextBox ID="idRaportu" runat="server"></asp:TextBox>
                        </td>
                        <td>Id. Sądu</td>
                        <td>

                            <asp:TextBox ID="idSad" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Twórz plik csv" OnClick="makeCSVFile" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto;  width: auto;">
  <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="3" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="col_33prc wciecie borderAll">Sąd Okręgowy w 
                            <br />
                            ..................................<br />
                            &nbsp;<br />
                        </td>
                        <td class="borderAll col_33prc center"><strong><span class="auto-style1">MS-S19o<br />
                            </span></strong>
                            <br />
                            <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                            <br />
                            w sprawach gospodarczych</td>
                        <td class="borderAll col_33prc wciecie">Adresat<br />
                            Ministerstwo Sprawiedliwości Departament Strategii i Funduszy Europejskich</td>
                    </tr>
                    <tr>
                        <td class="col_33prc wciecie borderAll">Obszar Sądu Apelacyjnego w<br />
                            ..................................<br />
                            . &nbsp;</td>
                        <td class="center borderAll">
                            za … kwartał …**) 20… r.</td>
                        <td class="borderAll col_33prc wciecie">
                            <br />
                            Termin przekazania:
                            <br />
                            do 10 dnia kalendarzowego po każdym kwartale z danymi narastającymi od początku roku do końca kwartału<br />
                        </td>
                    </tr>
                    </table>
                <br />
            </div>

            <br />
        </div>
        <br />
        <asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
        <br />

        <br />

     

        <br />
        <div id='1.1.g'>
            <strong>Dział 1.1.g</strong> Sprawy mediacyjne<table style="width: 100%;">
                <tr>
                    <td class="center borderAll" colspan="5" rowspan="2">Sądowe</td>
                    <td class="center borderAll" colspan="3">Sprawy</td>
                </tr>
                <tr>
                    <td class="borderAll center col_60">razem </td>
                    <td class="borderAll center col_60">w I instancji</td>
                    <td class="borderAll center col_60">w II instancji</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="5">0</td>
                    <td class="borderAll center col_60">1</td>
                    <td class="borderAll center col_60">2</td>
                    <td class="borderAll center col_60">3</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="5">wpływ </td>
                    <td class="borderAll wciecie" rowspan="5">Liczba</td>
                    <td class="borderAll wciecie" rowspan="3">spraw
        <br />
                        w których</td>
                    <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 <sup>8</sup> § 4 kpc)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                    <td class="borderAll col_36">2</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183<sup> 8</sup> § 1 kpc)</td>
                    <td class="borderAll col_36">3</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja)</td>
                    <td class="borderAll col_36">4</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 <sup>13</sup> § 2 kpc)</td>
                    <td class="borderAll col_36">5</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="8">Rozstrzy-<br />
                        gnięcie<br />
                        &nbsp;przed</td>
                    <td class="borderAll wciecie" rowspan="3">mesiatorem</td>
                    <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych
        <br />
                        w trybie (art. 183 <sup>8</sup> § 1 kpc) - liczba </td>
                    <td class="borderAll wciecie">ugód zawartych przed mediatorem</td>
                    <td class="borderAll col_36">6</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                    <td class="borderAll col_36">7</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                    <td class="borderAll col_36">8</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="5">sądem</td>
                    <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)</td>
                    <td class="borderAll col_36">9</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                    <td class="borderAll col_36">10</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc)</td>
                    <td class="borderAll col_36">11</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                    <td class="borderAll col_36">12</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                    <td class="borderAll col_36">13</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">Pozasądowe w I instancji</td>
                    <td class="borderAll center" colspan="4">Liczba</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">0</td>
                    <td class="borderAll center" colspan="4">1</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">Wpływ</td>
                    <td class="borderAll wciecie" colspan="3">liczba wniosków o zatwierdzenie ugody złożonych przez stronę</td>
                    <td class="borderAll col_36">14</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 <sup>13</sup> § 1 kpc)</td>
                    <td class="borderAll col_36">15</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">Rozstrzygnięcie</td>
                    <td class="borderAll wciecie" colspan="3">zatwierdzono ugodę</td>
                    <td class="borderAll col_36">16</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">nadano klauzulę wykonalności (art. 183 <sup>14 </sup>§ 2 kpc)</td>
                    <td class="borderAll col_36">17</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                    <td class="borderAll col_36">18</td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.g!2!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.g!3!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_g_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <br />
        <asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>
          
        <br />
        <div id='1.1.k'>

            <table style="width: 100%;">
                <tr>
                    <td><strong>Dział 1.1.k.</strong> w tym: - liczba zażaleń na postanowienie o udzielenie zabezpieczenia (art. 33) (dz. 1.1.1. w. 105, k.4)</td>
                    <td class="borderAll center col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_k_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <br />
           <div id='1.1.kx'>

             <asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>
        </div>

        <br />
        <div id="4.1.b">
            <strong>Dział 4.1.b</strong> Terminowość obiegu międzyinstancyjnego spraw odwoławczych
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Wpłynęło spraw</td>
                    <td class="center borderAll" rowspan="2">Ogółem (kol. 2 do 7) </td>
                    <td class="center borderAll" colspan="6">Z tego od daty orzeczenia sądu rejonowego do daty wpływu do sądu okręgowego upłynął okres</td>
                </tr>
                <tr>
                    <td class="center borderAll">do 2 mies.</td>
                    <td class="center borderAll">pow. 2 do 3 mies.</td>
                    <td class="center borderAll">pow. 3 do 6 mies.</td>
                    <td class="center borderAll">pow.6 do 12 miesięcy</td>
                    <td class="center borderAll">pow. 12 mies. do 2 lat</td>
                    <td class="center borderAll">ponad 2 lata</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="2">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Ga (apelacyjnych) </td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!1!4')">
                        <asp:Label ID="tab_4_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!2!4')">
                        <asp:Label ID="tab_4_1_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!3!4')">
                        <asp:Label ID="tab_4_1_b_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!4!4')">
                        <asp:Label ID="tab_4_1_b_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!5!4')">
                        <asp:Label ID="tab_4_1_b_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!6!4')">
                        <asp:Label ID="tab_4_1_b_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!7!4')">
                        <asp:Label ID="tab_4_1_b_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Gz (zażaleniowych)</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!1!4')">
                        <asp:Label ID="tab_4_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!2!4')">
                        <asp:Label ID="tab_4_1_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!3!4')">
                        <asp:Label ID="tab_4_1_b_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!4!4')">
                        <asp:Label ID="tab_4_1_b_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!5!4')">
                        <asp:Label ID="tab_4_1_b_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!6!4')">
                        <asp:Label ID="tab_4_1_b_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!7!4')">
                        <asp:Label ID="tab_4_1_b_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="4.2">
            <strong>Dział 4.2</strong> Liczba spraw, w których po wydaniu orzeczenia sądu odwoławczego akta
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Rodzaje spraw
                        <br />
                        z repertorium </td>
                    <td class="center borderAll" rowspan="2">Ogółem
                        <br />
                        (kol. od 2 do 6) </td>
                    <td class="center borderAll" colspan="5">w terminie</td>
                </tr>
                <tr>
                    <td class="center borderAll">do 1 miesiąca</td>
                    <td class="center borderAll">pow. 1 do 2 mies. </td>
                    <td class="center borderAll">pow. 2 do 3 mies. </td>
                    <td class="center borderAll">pow. 3 do 6 mies.</td>
                    <td class="center borderAll">ponad 6 miesięcy</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="2">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Ga (apelacyjnych) </td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!1!4')">
                        <asp:Label ID="tab_4_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!2!4')">
                        <asp:Label ID="tab_4_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!3!4')">
                        <asp:Label ID="tab_4_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!4!4')">
                        <asp:Label ID="tab_4_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!5!4')">
                        <asp:Label ID="tab_4_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!6!4')">
                        <asp:Label ID="tab_4_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Gz (zażaleniowych)</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!1!4')">
                        <asp:Label ID="tab_4_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!2!4')">
                        <asp:Label ID="tab_4_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!3!4')">
                        <asp:Label ID="tab_4_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!4!4')">
                        <asp:Label ID="tab_4_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!5!4')">
                        <asp:Label ID="tab_4_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!6!4')">
                        <asp:Label ID="tab_4_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="5.1">
            <strong>Dział 5.1</strong> Szczegółowe rozliczenie skargi (wykaz S)
            <table>
                <tr>
                    <td class="center borderAll" colspan="4" rowspan="4">Wyszczególnienie</td>
                    <td class="center borderAll" rowspan="4">Pozostało z ubiegłego roku</td>
                    <td class="center borderAll" rowspan="4">Wpłynęło</td>
                    <td class="center borderAll" colspan="6">Załatwiono</td>
                    <td class="center borderAll" colspan="4">Pozostało</td>
                    <td class="center borderAll" rowspan="4">Ogólna kwota zasądzonych odszkodowań (w złotych )</td>
                </tr>
                <tr>
                    <td class="center borderAll" rowspan="3">ogółem</td>
                    <td class="center borderAll" colspan="5">w tym </td>
                    <td class="center borderAll" rowspan="3">ogółem</td>
                    <td class="center borderAll" colspan="3" rowspan="2">w tym od wpływu</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="2">uwzględniono w całości lub w części</td>
                    <td class="center borderAll" rowspan="2">oddalono</td>
                    <td class="center borderAll" rowspan="2">odrzucono</td>
                    <td class="center borderAll" rowspan="2">w inny sposób</td>
                </tr>
                <tr>
                    <td class="center borderAll">razem</td>
                    <td class="center borderAll">w tym przez zasądzenie kwoty pieniężnej</td>
                    <td class="center borderAll">do 2 mies.</td>
                    <td class="center borderAll">pow. 2 do 4 mies.</td>
                    <td class="center borderAll">pow. 2 do 4 mies.</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="4">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
                    <td class="center borderAll">8</td>
                    <td class="center borderAll">9</td>
                    <td class="center borderAll">10</td>
                    <td class="center borderAll">11</td>
                    <td class="center borderAll">12</td>
                    <td class="center borderAll">13</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Ogółem (wiersze od 02 do 12) </td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="11">&nbsp;</td>
                    <td class="borderAll wciecie" colspan="2">zbyt odległe wyznaczenie terminu pierwszej rozprawy </td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">długość przerwy (odroczenia) między rozprawami </td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">zwłokę wykonania opinii przez biegłych albo zasięganie przez sędziów kolejnych opinii </td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">nadużywanie zawieszania postępowania </td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">przewlekłość trwania tzw. czynności wstępnych </td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w06_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">przewlekłość postępowania międzyinstancyjnego </td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w07_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w07_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w07_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w07_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w07_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">przewlekłość postępowania wykonawczego </td>
                    <td class="borderAll wciecie">sądu</td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w08_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w08_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w08_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w08_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w08_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w08_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">komornika</td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w09_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w09_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w09_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w09_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w09_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w09_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">bezczynność w podejmowaniu czynności procesowych </td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w10_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w10_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w10_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w10_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w10_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w10_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">nieterminowość sporządzania uzasadnień </td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w11_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w11_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w11_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">inne </td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!1!4')">
                        <asp:Label ID="tab_5_1_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!2!4')">
                        <asp:Label ID="tab_5_1_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!3!4')">
                        <asp:Label ID="tab_5_1_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!4!4')">
                        <asp:Label ID="tab_5_1_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!5!4')">
                        <asp:Label ID="tab_5_1_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!6!4')">
                        <asp:Label ID="tab_5_1_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!7!4')">
                        <asp:Label ID="tab_5_1_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!8!4')">
                        <asp:Label ID="tab_5_1_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!9!4')">
                        <asp:Label ID="tab_5_1_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!10!4')">
                        <asp:Label ID="tab_5_1_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!11!4')">
                        <asp:Label ID="tab_5_1_w12_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!12!4')">
                        <asp:Label ID="tab_5_1_w12_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!13!4')">
                        <asp:Label ID="tab_5_1_w12_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="5.2">
            <strong>Dział 5.2</strong> Kontrolka skarg (w wydziale, którego sprawy skarga dotyczy) (§ 448<sup>5</sup> ust. 1 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r.
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie </td>
                    <td class="center borderAll" rowspan="2">Wpłynęło </td>
                    <td class="center borderAll" rowspan="2">Przesłano do sądu właściwego</td>
                    <td class="center borderAll" colspan="3">Rozpoznanie skargi</td>
                    <td class="center borderAll" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                    <td class="center borderAll" rowspan="2">Kwota (w złotych) </td>
                </tr>
                <tr>
                    <td class="center borderAll">uwzględniono </td>
                    <td class="center borderAll">oddalono&nbsp; </td>
                    <td class="center borderAll">inne</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="2">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Skargi na pracę sądu</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!1!4')">
                        <asp:Label ID="tab_5_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!2!4')">
                        <asp:Label ID="tab_5_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!3!4')">
                        <asp:Label ID="tab_5_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!4!4')">
                        <asp:Label ID="tab_5_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!5!4')">
                        <asp:Label ID="tab_5_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!6!4')">
                        <asp:Label ID="tab_5_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!7!4')">
                        <asp:Label ID="tab_5_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />

        <div id="6">
            <strong>Dział 6</strong> Sprawy gospodarcze wielotomowe
            <table>
                <tr>
                    <td class="center borderAll" colspan="4" rowspan="2">SPRAWY z rep. </td>
                    <td class="center borderAll" colspan="7">Sprawy gospodarcze - Liczba spraw </td>
                </tr>
                <tr>
                    <td class="center borderAll">zbiorczo pow. 5 tomów (kol. od 2 do 7)</td>
                    <td class="center borderAll">pow. 5 do 10 tomów</td>
                    <td class="center borderAll">pow. 10 do 20 tomów</td>
                    <td class="center borderAll">pow. 20 do 30 tomów</td>
                    <td class="center borderAll">pow. 30 do 50 tomów</td>
                    <td class="center borderAll">pow. 50 do 100 tomów</td>
                    <td class="center borderAll">powyżej 100 tomów</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="4">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="9">GC</td>
                    <td class="borderAll wciecie" colspan="2">pozostało z poprzedniego okresu</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">
                        <asp:Label ID="tab_6_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!2!4')">
                        <asp:Label ID="tab_6_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!3!4')">
                        <asp:Label ID="tab_6_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!4!4')">
                        <asp:Label ID="tab_6_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!5!4')">
                        <asp:Label ID="tab_6_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!6!4')">
                        <asp:Label ID="tab_6_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!7!4')">
                        <asp:Label ID="tab_6_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">wpływ w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!1!4')">
                        <asp:Label ID="tab_6_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!2!4')">
                        <asp:Label ID="tab_6_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!3!4')">
                        <asp:Label ID="tab_6_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!4!4')">
                        <asp:Label ID="tab_6_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!5!4')">
                        <asp:Label ID="tab_6_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!6!4')">
                        <asp:Label ID="tab_6_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!7!4')">
                        <asp:Label ID="tab_6_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">w tym</td>
                    <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!1!4')">
                        <asp:Label ID="tab_6_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!2!4')">
                        <asp:Label ID="tab_6_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!3!4')">
                        <asp:Label ID="tab_6_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!4!4')">
                        <asp:Label ID="tab_6_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!5!4')">
                        <asp:Label ID="tab_6_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!6!4')">
                        <asp:Label ID="tab_6_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!7!4')">
                        <asp:Label ID="tab_6_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w wyniku zwrotu pozwu</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!1!4')">
                        <asp:Label ID="tab_6_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!2!4')">
                        <asp:Label ID="tab_6_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!3!4')">
                        <asp:Label ID="tab_6_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!4!4')">
                        <asp:Label ID="tab_6_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!5!4')">
                        <asp:Label ID="tab_6_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!6!4')">
                        <asp:Label ID="tab_6_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!7!4')">
                        <asp:Label ID="tab_6_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">wyłączenie sprawy (roszczenia) do odrębnego postępowania</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!1!4')">
                        <asp:Label ID="tab_6_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!2!4')">
                        <asp:Label ID="tab_6_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!3!4')">
                        <asp:Label ID="tab_6_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!4!4')">
                        <asp:Label ID="tab_6_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!5!4')">
                        <asp:Label ID="tab_6_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!6!4')">
                        <asp:Label ID="tab_6_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!7!4')">
                        <asp:Label ID="tab_6_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">załatwienie w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!1!4')">
                        <asp:Label ID="tab_6_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!2!4')">
                        <asp:Label ID="tab_6_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!3!4')">
                        <asp:Label ID="tab_6_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!4!4')">
                        <asp:Label ID="tab_6_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!5!4')">
                        <asp:Label ID="tab_6_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!6!4')">
                        <asp:Label ID="tab_6_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!7!4')">
                        <asp:Label ID="tab_6_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">w tym</td>
                    <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!1!4')">
                        <asp:Label ID="tab_6_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!2!4')">
                        <asp:Label ID="tab_6_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!3!4')">
                        <asp:Label ID="tab_6_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!4!4')">
                        <asp:Label ID="tab_6_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!5!4')">
                        <asp:Label ID="tab_6_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!6!4')">
                        <asp:Label ID="tab_6_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!7!4')">
                        <asp:Label ID="tab_6_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w wyniku zwrotu pozwu</td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!1!4')">
                        <asp:Label ID="tab_6_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!2!4')">
                        <asp:Label ID="tab_6_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!3!4')">
                        <asp:Label ID="tab_6_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!4!4')">
                        <asp:Label ID="tab_6_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!5!4')">
                        <asp:Label ID="tab_6_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!6!4')">
                        <asp:Label ID="tab_6_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!7!4')">
                        <asp:Label ID="tab_6_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">pozostało na następny okres sprawozdawczy</td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!1!4')">
                        <asp:Label ID="tab_6_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!2!4')">
                        <asp:Label ID="tab_6_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!3!4')">
                        <asp:Label ID="tab_6_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!4!4')">
                        <asp:Label ID="tab_6_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!5!4')">
                        <asp:Label ID="tab_6_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!6!4')">
                        <asp:Label ID="tab_6_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!7!4')">
                        <asp:Label ID="tab_6_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="6">Ga</td>
                    <td class="borderAll wciecie" colspan="2">pozostało z poprzedniego okresu</td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!1!4')">
                        <asp:Label ID="tab_6_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!2!4')">
                        <asp:Label ID="tab_6_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!3!4')">
                        <asp:Label ID="tab_6_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!4!4')">
                        <asp:Label ID="tab_6_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!5!4')">
                        <asp:Label ID="tab_6_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!6!4')">
                        <asp:Label ID="tab_6_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!7!4')">
                        <asp:Label ID="tab_6_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">wpływ w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!1!4')">
                        <asp:Label ID="tab_6_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!2!4')">
                        <asp:Label ID="tab_6_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!3!4')">
                        <asp:Label ID="tab_6_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!4!4')">
                        <asp:Label ID="tab_6_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!5!4')">
                        <asp:Label ID="tab_6_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!6!4')">
                        <asp:Label ID="tab_6_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!7!4')">
                        <asp:Label ID="tab_6_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym wpływ w wyniku przekazania z innej jednostki</td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!1!4')">
                        <asp:Label ID="tab_6_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!2!4')">
                        <asp:Label ID="tab_6_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!3!4')">
                        <asp:Label ID="tab_6_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!4!4')">
                        <asp:Label ID="tab_6_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!5!4')">
                        <asp:Label ID="tab_6_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!6!4')">
                        <asp:Label ID="tab_6_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!7!4')">
                        <asp:Label ID="tab_6_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">załatwienie w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">13</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!1!4')">
                        <asp:Label ID="tab_6_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!2!4')">
                        <asp:Label ID="tab_6_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!3!4')">
                        <asp:Label ID="tab_6_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!4!4')">
                        <asp:Label ID="tab_6_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!5!4')">
                        <asp:Label ID="tab_6_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!6!4')">
                        <asp:Label ID="tab_6_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!7!4')">
                        <asp:Label ID="tab_6_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym załatwienie w wyniku przekazania do innej jednostki</td>
                    <td class="borderAll col_36">14</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!1!4')">
                        <asp:Label ID="tab_6_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!2!4')">
                        <asp:Label ID="tab_6_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!3!4')">
                        <asp:Label ID="tab_6_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!4!4')">
                        <asp:Label ID="tab_6_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!5!4')">
                        <asp:Label ID="tab_6_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!6!4')">
                        <asp:Label ID="tab_6_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!7!4')">
                        <asp:Label ID="tab_6_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">pozostało na następny okres sprawozdawczy</td>
                    <td class="borderAll col_36">15</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!1!4')">
                        <asp:Label ID="tab_6_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!2!4')">
                        <asp:Label ID="tab_6_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!3!4')">
                        <asp:Label ID="tab_6_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!4!4')">
                        <asp:Label ID="tab_6_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!5!4')">
                        <asp:Label ID="tab_6_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!6!4')">
                        <asp:Label ID="tab_6_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!7!4')">
                        <asp:Label ID="tab_6_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="6.1">
            <strong>Dział 6.1</strong> Obsada Sądu (Wydziału)
             <table>
                 <tr>
                     <td class="center borderAll" colspan="2">Wyszczególnienie </td>
                     <td class="center borderAll">Liczba sędziów SO i wakujących stanowisk sędziowskich w ramach limitu (na ostatni dzień okresu statystycznego)</td>
                     <td class="center borderAll">Liczba sędziów SO i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym) </td>
                     <td class="center borderAll">Obsada średniookresowa (sędziowie SO) z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP oraz sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy wymiarze w SA i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SO czy SR </td>
                     <td class="center borderAll">Liczba sędziów SO z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości , KSSiP oraz sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy wymiarze w SA i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SO czy SR</td>
                     <td class="center borderAll">Obsada średniookresowa sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA</td>
                     <td class="center borderAll">Liczba sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA</td>
                     <td class="center borderAll">Obsada średniookresowa sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SA</td>
                     <td class="center borderAll">Obsada średniookresowa sędziów SO w ramach limitu delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości</td>
                     <td class="center borderAll">Obsada średnio-okresowa sędziów SO w ramach limitu delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości </td>
                     <td class="center borderAll">Liczba sędziów SO delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości </td>
                     <td class="center borderAll">Obsada średniookresowa sędziów SO w ramach limitu delegowanych do pełnienia czynności w Krajowej Szkole Sądownictwa i Prokuratury </td>
                     <td class="center borderAll">Liczba sędziów SO delego-wanych do pełnienia czynności w Krajowej Szkole Sądow-<br />
                         nictwa i Prokuratury</td>
                     <td class="center borderAll">Obsada sędziów SA delegowanych do pełnienia czynności orzeczniczych w pełnym lun niepełnym wymiarze w SO </td>
                     <td class="center borderAll">Liczba sędziów SA delegowanych do pełnienia czynności orzeczniczych w pełnym lun niepełnym wymiarze w SO </td>
                     <td class="center borderAll">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w SR</td>
                     <td class="center borderAll">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w SR</td>
                     <td class="center borderAll">Obsada sędziów SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SR </td>
                     <td class="center borderAll">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SR</td>
                     <td class="center borderAll">Obsada sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO</td>

                     <td class="center borderAll">Liczba sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO </td>
                     <td class="center borderAll">Obsada sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO</td>
                     <td class="center borderAll">Liczba sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO</td>
                     <td class="center borderAll">Obsada sędziów innego SO delegowanych do pełnienia czynności orzeczniczych w pełnym lun niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO</td>
                     <td class="center borderAll">Liczba sędziów innego SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO</td>
                     <td class="center borderAll">Obsada średniookresowa (sędziowie funkcyjni SO) </td>
                     <td class="center borderAll">I wersja Obsada średniookresowa (sędziowie funkcyjni SO) </td>
                     <td class="center borderAll">II wersja Liczba sędziów SO funkcyjnych tego sądu</td>
                     <td class="center borderAll">Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze) </td>
                     <td class="center borderAll">Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) </td>
                     <td class="center borderAll">Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) </td>
                     <td class="center borderAll">Liczba sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) </td>
                     <td class="center borderAll">Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp) </td>
                     <td class="center borderAll">Liczba sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp) </td>
                     <td class="center borderAll">Łączna liczba sesji w danym okresie staty-stycznym (rozpra-wy i posiedzenia) sędziów SO z wyłączeniem sędziów funkcyj-nych sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymia-rze, czy też wykonujących czynności orzecz-nicze na mocy ustawy sędziów SO delegowanych do pełnienia czynności orzecz-niczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP</td>
                     <td class="center borderAll">Średniookresowa liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) jednego sędziego SO z wyłączeniem sędziów funkcyjnych sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy, sędziów SO delegowanych do pełnienia czynności orzeczniczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP</td>
                     <td class="center borderAll">Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego) </td>
                     <td class="center borderAll">Liczba obsadzonych etatów (w okresie statystycznym)</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="2">0</td>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                     <td class="center borderAll">3</td>
                     <td class="center borderAll">4</td>
                     <td class="center borderAll">5</td>
                     <td class="center borderAll">6</td>
                     <td class="center borderAll">7</td>
                     <td class="center borderAll">8</td>
                     <td class="center borderAll">9</td>
                     <td class="center borderAll">10</td>
                     <td class="center borderAll">11</td>
                     <td class="center borderAll">12</td>
                     <td class="center borderAll">13</td>
                     <td class="center borderAll">14</td>
                     <td class="center borderAll">15</td>
                     <td class="center borderAll">16</td>
                     <td class="center borderAll">17</td>
                     <td class="center borderAll">18</td>
                     <td class="center borderAll">19</td>
                     <td class="center borderAll">20</td>
                     <td class="center borderAll">21</td>
                     <td class="center borderAll">22</td>
                     <td class="center borderAll">23</td>
                     <td class="center borderAll">24</td>
                     <td class="center borderAll">25</td>
                     <td class="center borderAll">26</td>
                     <td class="center borderAll">27</td>
                     <td class="center borderAll">28</td>
                     <td class="center borderAll">29</td>
                     <td class="center borderAll">30</td>
                     <td class="center borderAll">31</td>
                     <td class="center borderAll">32</td>
                     <td class="center borderAll">33</td>
                     <td class="center borderAll">34</td>
                     <td class="center borderAll">35</td>
                     <td class="center borderAll">36</td>
                     <td class="center borderAll">37</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Sędziowie (zbiorczo I i II instancja)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!1!4')">
                         <asp:Label ID="tab_6_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!2!4')">
                         <asp:Label ID="tab_6_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!3!4')">
                         <asp:Label ID="tab_6_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!4!4')">
                         <asp:Label ID="tab_6_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!5!4')">
                         <asp:Label ID="tab_6_1_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!6!4')">
                         <asp:Label ID="tab_6_1_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!7!4')">
                         <asp:Label ID="tab_6_1_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!8!4')">
                         <asp:Label ID="tab_6_1_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!9!4')">
                         <asp:Label ID="tab_6_1_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!10!4')">
                         <asp:Label ID="tab_6_1_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!11!4')">
                         <asp:Label ID="tab_6_1_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!12!4')">
                         <asp:Label ID="tab_6_1_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!13!4')">
                         <asp:Label ID="tab_6_1_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!14!4')">
                         <asp:Label ID="tab_6_1_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!15!4')">
                         <asp:Label ID="tab_6_1_w01_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!16!4')">
                         <asp:Label ID="tab_6_1_w01_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!17!4')">
                         <asp:Label ID="tab_6_1_w01_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!18!4')">
                         <asp:Label ID="tab_6_1_w01_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!19!4')">
                         <asp:Label ID="tab_6_1_w01_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!20!4')">
                         <asp:Label ID="tab_6_1_w01_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!21!4')">
                         <asp:Label ID="tab_6_1_w01_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!22!4')">
                         <asp:Label ID="tab_6_1_w01_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!23!4')">
                         <asp:Label ID="tab_6_1_w01_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!24!4')">
                         <asp:Label ID="tab_6_1_w01_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!25!4')">
                         <asp:Label ID="tab_6_1_w01_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!26!4')">
                         <asp:Label ID="tab_6_1_w01_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!27!4')">
                         <asp:Label ID="tab_6_1_w01_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!28!4')">
                         <asp:Label ID="tab_6_1_w01_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!29!4')">
                         <asp:Label ID="tab_6_1_w01_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!30!4')">
                         <asp:Label ID="tab_6_1_w01_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!31!4')">
                         <asp:Label ID="tab_6_1_w01_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!32!4')">
                         <asp:Label ID="tab_6_1_w01_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!33!4')">
                         <asp:Label ID="tab_6_1_w01_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!34!4')">
                         <asp:Label ID="tab_6_1_w01_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!35!4')">
                         <asp:Label ID="tab_6_1_w01_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!36!4')">
                         <asp:Label ID="tab_6_1_w01_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1!37!4')">
                         <asp:Label ID="tab_6_1_w01_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">I instancja</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!1!4')">
                         <asp:Label ID="tab_6_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!2!4')">
                         <asp:Label ID="tab_6_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!3!4')">
                         <asp:Label ID="tab_6_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!4!4')">
                         <asp:Label ID="tab_6_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!5!4')">
                         <asp:Label ID="tab_6_1_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!6!4')">
                         <asp:Label ID="tab_6_1_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!7!4')">
                         <asp:Label ID="tab_6_1_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!8!4')">
                         <asp:Label ID="tab_6_1_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!9!4')">
                         <asp:Label ID="tab_6_1_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!10!4')">
                         <asp:Label ID="tab_6_1_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!11!4')">
                         <asp:Label ID="tab_6_1_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!12!4')">
                         <asp:Label ID="tab_6_1_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!13!4')">
                         <asp:Label ID="tab_6_1_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!14!4')">
                         <asp:Label ID="tab_6_1_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!15!4')">
                         <asp:Label ID="tab_6_1_w02_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!16!4')">
                         <asp:Label ID="tab_6_1_w02_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!17!4')">
                         <asp:Label ID="tab_6_1_w02_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!18!4')">
                         <asp:Label ID="tab_6_1_w02_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!19!4')">
                         <asp:Label ID="tab_6_1_w02_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!20!4')">
                         <asp:Label ID="tab_6_1_w02_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!21!4')">
                         <asp:Label ID="tab_6_1_w02_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!22!4')">
                         <asp:Label ID="tab_6_1_w02_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!23!4')">
                         <asp:Label ID="tab_6_1_w02_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!24!4')">
                         <asp:Label ID="tab_6_1_w02_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!25!4')">
                         <asp:Label ID="tab_6_1_w02_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!26!4')">
                         <asp:Label ID="tab_6_1_w02_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!27!4')">
                         <asp:Label ID="tab_6_1_w02_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!28!4')">
                         <asp:Label ID="tab_6_1_w02_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!29!4')">
                         <asp:Label ID="tab_6_1_w02_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!30!4')">
                         <asp:Label ID="tab_6_1_w02_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!31!4')">
                         <asp:Label ID="tab_6_1_w02_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!32!4')">
                         <asp:Label ID="tab_6_1_w02_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!33!4')">
                         <asp:Label ID="tab_6_1_w02_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!34!4')">
                         <asp:Label ID="tab_6_1_w02_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!35!4')">
                         <asp:Label ID="tab_6_1_w02_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!36!4')">
                         <asp:Label ID="tab_6_1_w02_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1!37!4')">
                         <asp:Label ID="tab_6_1_w02_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">II instancja</td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!1!4')">
                         <asp:Label ID="tab_6_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!2!4')">
                         <asp:Label ID="tab_6_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!3!4')">
                         <asp:Label ID="tab_6_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!4!4')">
                         <asp:Label ID="tab_6_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!5!4')">
                         <asp:Label ID="tab_6_1_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!6!4')">
                         <asp:Label ID="tab_6_1_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!7!4')">
                         <asp:Label ID="tab_6_1_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!8!4')">
                         <asp:Label ID="tab_6_1_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!9!4')">
                         <asp:Label ID="tab_6_1_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!10!4')">
                         <asp:Label ID="tab_6_1_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!11!4')">
                         <asp:Label ID="tab_6_1_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!12!4')">
                         <asp:Label ID="tab_6_1_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!13!4')">
                         <asp:Label ID="tab_6_1_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!14!4')">
                         <asp:Label ID="tab_6_1_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!15!4')">
                         <asp:Label ID="tab_6_1_w03_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!16!4')">
                         <asp:Label ID="tab_6_1_w03_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!17!4')">
                         <asp:Label ID="tab_6_1_w03_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!18!4')">
                         <asp:Label ID="tab_6_1_w03_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!19!4')">
                         <asp:Label ID="tab_6_1_w03_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!20!4')">
                         <asp:Label ID="tab_6_1_w03_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!21!4')">
                         <asp:Label ID="tab_6_1_w03_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!22!4')">
                         <asp:Label ID="tab_6_1_w03_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!23!4')">
                         <asp:Label ID="tab_6_1_w03_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!24!4')">
                         <asp:Label ID="tab_6_1_w03_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!25!4')">
                         <asp:Label ID="tab_6_1_w03_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!26!4')">
                         <asp:Label ID="tab_6_1_w03_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!27!4')">
                         <asp:Label ID="tab_6_1_w03_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!28!4')">
                         <asp:Label ID="tab_6_1_w03_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!29!4')">
                         <asp:Label ID="tab_6_1_w03_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!30!4')">
                         <asp:Label ID="tab_6_1_w03_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!31!4')">
                         <asp:Label ID="tab_6_1_w03_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!32!4')">
                         <asp:Label ID="tab_6_1_w03_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!33!4')">
                         <asp:Label ID="tab_6_1_w03_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!34!4')">
                         <asp:Label ID="tab_6_1_w03_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!35!4')">
                         <asp:Label ID="tab_6_1_w03_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!36!4')">
                         <asp:Label ID="tab_6_1_w03_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1!37!4')">
                         <asp:Label ID="tab_6_1_w03_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
       <asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>
        <br />
        <br />
        W poniższych działach odnoszących się do biegłych i tłumaczy wykazujemy dane dotyczące opinii i tłumaczeń zleconych po 1 stycznia 2017r.
        <br />
        <div id='7.1'>
            <strong>Dział 7.1</strong> Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)
    <table>
        <tr>
            <td class="center borderAll" colspan="3" rowspan="2">Sprawy wg repertoriów</td>
            <td class="center borderAll" colspan="4">Liczba powołanych biegłych</td>
        </tr>
        <tr>
            <td class="center borderAll">Razem (kol. 2-4)</td>
            <td class="center borderAll">biegli sądowi</td>
            <td class="center borderAll">biegli spoza listy</td>
            <td class="center borderAll">inne podmioty</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="3">0</td>
            <td class="center borderAll">1</td>
            <td class="center borderAll">2</td>
            <td class="center borderAll">3</td>
            <td class="center borderAll">4</td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ogółem (w. 02+05)</td>
            <td class="borderAll col_36">1</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">I instancja ogółem</td>
            <td class="borderAll col_36">2</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="2">w tym</td>
            <td class="borderAll wciecie">GC </td>
            <td class="borderAll col_36">3</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">GNs</td>
            <td class="borderAll col_36">4</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">II instancja ogółem</td>
            <td class="borderAll col_36">5</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">w tzm Ga</td>
            <td class="borderAll col_36">6</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_7_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

       
       
        <br />
           <asp:PlaceHolder runat="server" ID="tablePlaceHolder05"></asp:PlaceHolder>
        <br />
        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 8.1</strong> Liczba powołań tłumaczy </td>
                <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.1!1!4')">
                    <asp:Label CssClass="normal" ID="tab_8_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
        <br />
        <div id='8.2'>
            <strong>Dział 8.2</strong> Terminowość sporządzania tłumaczeń pisemnych
    <table>
        <tr>
            <td class="center borderAll" colspan="8">Liczba sporządzonych tłumaczeń pisemnych</td>
        </tr>
        <tr>
            <td class="center borderAll" rowspan="2">razem (kol.1= 2 do 5 = 6 do 8)</td>
            <td class="center borderAll" rowspan="2">w ustalonym terminie</td>
            <td class="center borderAll" colspan="3">po ustalonym terminie</td>
            <td class="center borderAll" colspan="3">wg czasu wydania tłumaczenia</td>
        </tr>
        <tr>
            <td class="center borderAll">do 30 dni</td>
            <td class="center borderAll">pow. 1 do 3 miesięcy</td>
            <td class="center borderAll">pow. 3 miesięcy</td>
            <td class="center borderAll">do 30 dni</td>
            <td class="center borderAll">pow. 1 do 3 miesięcy</td>
            <td class="center borderAll">pow. 3 miesięcy)</td>
        </tr>
        <tr>
            <td class="center borderAll">1</td>
            <td class="center borderAll">2</td>
            <td class="center borderAll">3</td>
            <td class="center borderAll">4</td>
            <td class="center borderAll">5</td>
            <td class="center borderAll">6</td>
            <td class="center borderAll">7</td>
            <td class="center borderAll">8</td>
        </tr>
        <tr>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!1!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!2!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!3!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!4!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!5!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!6!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!7!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!8!4')">
                <asp:Label CssClass="normal" ID="tab_8_2_w01_c08" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <br />
        <div id="8.3">
            <strong>Dział 8.3</strong> Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo
            <table>
                <tr>
                    <td class="center borderAll" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                    <td class="center borderAll" colspan="8">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia </td>
                </tr>
                <tr>
                    <td class="center borderAll">razem (kol.2-4)</td>
                    <td class="center borderAll">do 14 dni</td>
                    <td class="center borderAll">pow. 14 do 30 dni</td>
                    <td class="center borderAll">powyżej miesiąca</td>
                    <td class="center borderAll">razem (kol.6-8)</td>
                    <td class="center borderAll">do 14 dni</td>
                    <td class="center borderAll">pow. 14 do 30 dni</td>
            <td class="center borderAll">razem powyżej miesiąca (kol. 9-12)</td>
            <td class="center borderAll">pow. 1 do 2 miesięcy</td>
            <td class="center borderAll">pow. 2 do 3 miesięcy</td>
            <td class="center borderAll">pow. 3 do 6 miesięcy</td>
            <td class="center borderAll">pow. 6 miesięcy</td>
                </tr>
                <tr>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
            <td class="center borderAll">8</td>
            <td class="center borderAll">9</td>
            <td class="center borderAll">10</td>
            <td class="center borderAll">11</td>
            <td class="center borderAll">12</td>
                </tr>
                <tr>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!1!4')">
                        <asp:Label ID="tab_8_3_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!2!4')">
                        <asp:Label ID="tab_8_3_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!3!4')">
                        <asp:Label ID="tab_8_3_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!4!4')">
                        <asp:Label ID="tab_8_3_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!5!4')">
                        <asp:Label ID="tab_8_3_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!6!4')">
                        <asp:Label ID="tab_8_3_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!7!4')">
                        <asp:Label ID="tab_8_3_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!8!4')">
                        <asp:Label ID="tab_8_3_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                   <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!9!4')">
                        <asp:Label ID="tab_8_3_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                  <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!10!4')">
                        <asp:Label ID="tab_8_3_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!11!4')">
                        <asp:Label ID="tab_8_3_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                   <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!12!4')">
                        <asp:Label ID="tab_8_3_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <p class="style20">
            <b><span lang="PL" style="font-family: &quot; arial&quot; ,sans-serif">Dział 9. </span></b><span style="font-family: &quot; arial&quot; ,sans-serif;"><span lang="PL" style="mso-bidi-font-weight: normal">Obciążenia administracyjne respondentów</span></span><span lang="PL"><o:p></o:p></span>
        </p>
        <table style="width: 100%;">
            <tr>
                <td>Proszę podać czas (w minutach) przeznaczony na: </td>

                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp; przygotowanie danych dla potrzeb wypełnianego formularza&nbsp;</td>
                <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!1!4')">
                    <asp:Label CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp; wypełnienie formularza&nbsp;</td>
                <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!9!1!4')">
                    <asp:Label CssClass="normal" ID="tab_9_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
        <br />
        <br />

        <br />
    </div>
</asp:Content>