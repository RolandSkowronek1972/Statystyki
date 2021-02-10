<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss11r.aspx.cs" Inherits="Statystyki_2018.mss11r" MaintainScrollPositionOnPostback="true" %>

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

        .auto-style1 {
            font-weight: bold;
        }
    </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position: relative; width: 1150px; left: 0px;">

                <table class="tbl_manu">

                    <tr>
                        <td style="width: 90px;">
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
                            <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 59px; left: 3px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto; visibility: hidden;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700" Visible="False"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Id_dzialu" Visible="False"></asp:Label>
            </div>

            <br />
         <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc" colspan="2">Sąd&nbsp; 1. Rejonowy
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Okręgowy<br />
                            w ..................................<br />
                            &nbsp;<br />
                        </td>
                        <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S11r<br />
                            </span></strong>
                            <br />
                            <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                            <br />
                            z zakresu prawa pracy i ubezpieczeń społecznych
                            <br />
                        </td>
                        <td class="borderAll col_33prc" rowspan="2">Adresaci:
                            <br />
                            1. Sąd Okręgowy
                            <br />
                            2. Ministerstwo Sprawiedliwości Departament Strategii i Funduszy Europejskich </td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc" colspan="2">Okręg Sądu</td>
                    </tr>
                    <tr>
                        <td class="borderAll">Okręgowego
                            <br />
                            w ......................</td>
                        <td class="borderAll">Apelacyjnego
                            <br />
                            w ......................</td>
                        <td class="center borderAll">
                            za … kwartał …**) 20… r.</td>
                        <td class="borderAll col_33prc">Sprawozdanie należy przekazać adresatom w terminie:<br />
&nbsp;1. do 9 dnia kalendarzowego po półroczu i roku
                            <br />
&nbsp;2. do 14 dnia kalendarzowego po półroczu i roku</td>
                    </tr>
                    </table>
                <br />

            <br />
            <br />
        </div>

        <div id="tab1.1.1.a">
            <asp:PlaceHolder ID="tablePlaceHolder01" runat="server"></asp:PlaceHolder>
            <br />
          <br />
        </div>

        <div class="page-break">
            <br />
            <table style="width: 100%;">
                <tr>
                    <td><strong>Dział 1.1.2.a.</strong> Wpływ spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (co najmniej 10 pracowników) (dział 1.1.2. wiersz 2 rubryka 2 lit. a) </td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112a_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>Dział 1.1.2.b.</strong> Załatwienie spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (co najmniej 10 pracowników) (dział 1.1.2. wiersz 2 rubryka 3 lit. b) </td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">
            <br />

            <strong>Dział 1.1.2.c.</strong> (dział 1.1.2. wiersz 90 kolumna 4 lit. c)
            <br />
            <table style="width: 80%">
                <tr>
                    <td class="borderAll center" colspan="3" rowspan="2">Wyszczególnienie</td>
                    <td class="borderAll center" colspan="2">Liczby</td>
                </tr>
                <tr>
                    <td class="borderAll center col_120">P</td>
                    <td class="borderAll center col_120">Np</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="3">0</td>
                    <td class="borderAll center col_120">1</td>
                    <td class="borderAll center col_120">2</td>
                </tr>
                <tr>
                    <td class="borderAll center" rowspan="3">Wydano nakaz zapłaty</td>
                    <td class="borderAll wciecie">w postępowaniu nakazowym</td>
                    <td class="borderAll">01</td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w postępowaniu upominawczym</td>
                    <td class="borderAll">02</td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w europejskim postępowaniu nakazowym </td>
                    <td class="borderAll">03</td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
        </div>
        <div class="page-break">
            <br />

            <strong>Dział 1.1.2.d</strong>. (dział 1.1.2. wiersz 109 kolumna 3 lit. d) W tym: skarga o stwierdzenie niezgodności z prawem
            <br />
            <table style="width: 75%">
                <tr>
                    <td class="borderAll" colspan="3">Wyszczególnienie</td>
                    <td class="borderAll col_120 center">Liczby</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="3">0</td>
                    <td class="borderAll col_120 center">1</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Przekazane Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem</td>
                    <td class="borderAll">01</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07) </td>
                    <td class="borderAll">02</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="5">w których
       <br />
                        Sąd Najwyższy</td>
                    <td class="borderAll wciecie">odmówił przyjęcia skargi (art.4249 kpc)</td>
                    <td class="borderAll">03</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">odrzucił skargę (art.4248 kpc)</td>
                    <td class="borderAll">04</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">oddalił skargę (art.42411 §1 kpc)</td>
                    <td class="borderAll">05</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">uwzględnił skargę (art.42411 §2 kpc)</td>
                    <td class="borderAll">06</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">załatwił w inny sposób</td>
                    <td class="borderAll">07</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.d!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112d_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
        </div>

        <div id="tab211">

            <br />
            <b>Dział 1.1.2.e.</b> Sprawy mediacyjne<div id='1.1.2.e' class="page-break">
                <table style="width: 100%;">
                    <tr>
                        <td class="center borderAll" colspan="5">Sądowe</td>
                        <td class="center borderAll">Liczba </td>
                        <td class="center borderAll" colspan="2">&nbsp;</td>
                        <td class="center borderAll">Liczba </td>
                    </tr>
                    <tr>
                        <td class="center borderAll" colspan="5">0</td>
                        <td class="center borderAll">1</td>
                        <td class="center borderAll" colspan="2">&nbsp;</td>
                        <td class="center borderAll">2</td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" rowspan="5">wpływ</td>
                        <td class="borderAll center borderAll" rowspan="5">Liczba</td>
                        <td class="borderAll center borderAll" rowspan="3">Spraw</td>
                        <td class="borderAll center borderAll">Liczba spraw, w których przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc) </td>
                        <td class="borderAll col_36">1</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll " rowspan="2">Liczba wniosków o zatwierdzenie ugody złożonych przez stronę </td>
                        <td class=" center borderAll col_36" rowspan="2">14</td>
                        <td class="center borderAll " rowspan="2"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.e!2!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll">Strony skierowano do mediacji po spotkaniu informacyjnym</td>
                        <td class="borderAll col_36">2</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll">Strony skierowano do mediacji na podstawie postanowienia sądu art. 183 8 § 1 kpc</td>
                        <td class="borderAll col_36">3</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll " rowspan="3">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 13 § 1 kpc)</td>
                        <td class=" center borderAll col_36" rowspan="3">15</td>
                        <td class="center borderAll " rowspan="3"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.e!2!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">mediacje ogółem (w jednej sprawie może być więcej niż jedna mediacja)</td>
                        <td class="borderAll col_36">4</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 13 § 2 kpc)</td>
                        <td class="borderAll col_36">5</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" rowspan="8">Rozstrzygnięcie przed</td>
                        <td class="borderAll center borderAll" rowspan="3">mediatorem</td>
                        <td class="borderAll center borderAll" rowspan="3">w sprawach skierowanych w trybie (art. 183 8 § 1 kpc) - liczba </td>
                        <td class="borderAll center borderAll">ugód zawartych przed mediatorem</td>
                        <td class="borderAll col_36">6</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll " colspan="3" rowspan="3">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll">spraw, w których nie zawarto ugody przed mediatorem</td>
                        <td class="borderAll col_36">7</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 05 i 06</td>
                        <td class="borderAll col_36">8</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" rowspan="5">sądem</td>
                        <td class="borderAll center borderAll" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)</td>
                        <td class="borderAll col_36">9</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll ">Zatwierdzono ugodę</td>
                        <td class="center borderAll ">16</td>
                        <td class="center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.e!2!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc</td>
                        <td class="borderAll col_36">10</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll ">Nadano klauzulę wykonalności (art. 183 14 § 2 kpc)</td>
                        <td class="center borderAll ">17</td>
                        <td class="center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.e!2!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 14 § 1 i 2 kpc)</td>
                        <td class="borderAll col_36">11</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll ">Odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc) </td>
                        <td class="center borderAll ">18</td>
                        <td class="center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.e!2!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc</td>
                        <td class="borderAll col_36">12</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="wciecie borderAll center borderAll " colspan="3" rowspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="borderAll center borderAll" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc)</td>
                        <td class="borderAll col_36">13</td>
                        <td class="borderAll center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.e!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112e_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
            </div>

            <br />
            <br />
        </div>
        <div class="page-break">

            <table style="width: 100%;">
                <tr>
                    <td>
                        <b>Dział 1.1.2.f.   Liczba wyznaczonych ławników (osoby)
                    </td>
                    <td class="borderAll col_125">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_112f_w01_c01" runat="server" Text="0"></asp:Label>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="page-break">

            <strong>Dział 1.1.2.g</strong>. <b style="mso-bidi-font-weight:normal"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:PL;mso-fareast-language:PL;mso-bidi-language:
AR-SA">w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym (dz.1.1.2. w. 02 kol. 2,3,4,5)</span></b><br />
            <table style="width: 50%">
                <tr>
                    <td class="borderAll center" colspan="3">Wyszczególnienie</td>
                    <td class="borderAll col_120 center">Liczba spraw</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="3">0</td>
                    <td class="borderAll col_120 center">1</td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="2">Wpłynęło</td>
                    <td class="borderAll">01</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112g_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="2">Załatwiono</td>
                    <td class="borderAll">02</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112g_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll" rowspan="2">w tym</td>
                    <td class="borderAll">uwzględniono w całości lub w części</td>
                    <td class="borderAll">03</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112g_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll">oddalono</td>
                    <td class="borderAll">04</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112g_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="2">Pozostało</td>
                    <td class="borderAll">05</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.g!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112g_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
        </div>
        <asp:PlaceHolder ID="tablePlaceHolder02" runat="server"></asp:PlaceHolder>
        <br />
            Sprawy z zakresu prawa pracy i ubezpieczeń społecznych – część wspólna<br />
        <br />
        <br />
          <asp:PlaceHolder ID="tablePlaceHolder03" runat="server"></asp:PlaceHolder>
         <br />

        <div id="debag">

            <div class="page-break">

                <strong>
                    <br />
                    Dział 6. </strong>Prawomocnie zasądzone odszkodowania i zadośćuczynienia (w okresie sprawozdawczym)
		      <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center" rowspan="3" colspan="4">Wyszczególnienia</td>
                        <td class="borderAll center" rowspan="3">L.P.</td>
                        <td class="borderAll center" colspan="3">Liczba</td>
                        <td class="borderAll center" rowspan="3">Łączna wysokość odszkodowań (zł)</td>
                        <td class="borderAll center" rowspan="3">Łączna wysokość zadośćuczynienia</td>
                    </tr>
                    <tr>
                        <td class="borderAll center" rowspan="2">spraw</td>
                        <td class="borderAll center" colspan="2">osób którym zasądzono</td>
                    </tr>
                    <tr>
                        <td class="borderAll center">odszkodowania</td>
                        <td class="borderAll center">zadośćuczynienia</td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="5">0</td>
                        <td class="borderAll bol_120 center">1</td>
                        <td class="borderAll bol_120 center">2</td>
                        <td class="borderAll bol_120 center">3</td>
                        <td class="borderAll bol_120 center">4</td>
                        <td class="borderAll bol_120 center">5</td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="4">Ogółem ubezpieczeniowe (w. 02 do 06)</td>
                        <td class="borderAll">01</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="2" rowspan="2">odszkodowania z tytułu</td>
                        <td class="borderAll">wypadku przy pracy rolniczej lub rolniczej choroby zawodowej</td>
                        <td class="borderAll">514</td>
                        <td class="borderAll">02</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w02_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w02_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w02_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w02_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w02_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll">wypadku przy pracy lub choroby zawodowej </td>
                        <td class="borderAll">516</td>
                        <td class="borderAll">03</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w03_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w03_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w03_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w03_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w03_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">Odszkodowania przysługujące w razie wypadków lub chorób pozostających w związku ze służbą wojskową, w Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służbie Więziennej, Państwowej Straży Pożarnej i Służbie Celnej</td>
                        <td class="borderAll">559</td>
                        <td class="borderAll">04</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w04_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w04_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w04_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w04_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w04_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy gospodarstw rolnych) </td>
                        <td class="borderAll">-</td>
                        <td class="borderAll">05</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w05_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w05_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w05_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w05_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w05_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">inne</td>
                        <td class="borderAll">-</td>
                        <td class="borderAll">06</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w06_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w06_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w06_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w06_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w06_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="4">Ogółem pracy (w. 8 do 23)</td>
                        <td class="borderAll">07</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w07_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w07_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w07_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w07_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w07_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">O odszkodowanie z tytułu niewydania w terminie świadectwa pracy lub wydania niewłaściwego świadectwa pracy</td>
                        <td class="borderAll">405</td>
                        <td class="borderAll">08</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w08_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w08_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w08_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w08_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w08_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">O odszkodowanie należne pracownikowi za okres obowiązywania zakazu konkurencji </td>
                        <td class="borderAll">450</td>
                        <td class="borderAll">09</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w09_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w09_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w09_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w09_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w09_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="3">O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy wypadku przy pracy w gospodarstwie rolnym) </td>
                        <td class="borderAll">451</td>
                        <td class="borderAll">10</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w10_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w10_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w10_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w10_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w10_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll" colspan="2" rowspan="2">O odszkodowanie z tytułu naruszenia zasady równego traktowania w zatrudnieniu dotyczy (art. 183d kp) </td>
                        <td class="borderAll">kobiet</td>
                        <td class="borderAll">458dk </td>
                        <td class="borderAll">11</td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!6!1!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w11_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!6!2!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w11_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!6!3!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w11_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!6!4!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w11_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!6!5!4')">
                            <asp:Label CssClass="normal" ID="tab_6_w11_c05" runat="server" Text="0"></asp:Label>
                        </a></td>

                        <tr>
                            <td class="borderAll">mężczyzn</td>
                            <td class="borderAll">458m </td>
                            <td class="borderAll">12</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w12_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w12_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w12_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w12_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w12_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="2" rowspan="2">O odszkodowanie w związku z molestowaniem seksualnym, jako jedną z form dyskryminacji w miejscu pracy dotyczy (art.183a§ 6 kp w zw. z art. 183d kp) </td>
                            <td class="borderAll">kobiet</td>
                            <td class="borderAll">459dk </td>
                            <td class="borderAll">13</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w13_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w13_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w13_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w13_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w13_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll">mężczyzn</td>
                            <td class="borderAll">459dm </td>
                            <td class="borderAll">14</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w14_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w14_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w14_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w14_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w14_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="2" rowspan="2">O zadośćuczynienie w związku z mobbingiem dotyczy (art. 943§3 kp) </td>
                            <td class="borderAll">kobiet</td>
                            <td class="borderAll">462dk </td>
                            <td class="borderAll">15</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w15_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w15_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w15_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w15_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w15_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll">mężczyzn</td>
                            <td class="borderAll">462dm </td>
                            <td class="borderAll">16</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=16!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w16_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=16!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w16_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=16!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w16_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=16!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w16_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=16!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w16_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="2" rowspan="2">O odszkodowanie w związku z mobbingiem dotyczy (art. 943§4 kp) </td>
                            <td class="borderAll">kobiet</td>
                            <td class="borderAll">463dk </td>
                            <td class="borderAll">17</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=17!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w17_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=17!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w17_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=17!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w17_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=17!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w17_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=17!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w17_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll">mężczyzn</td>
                            <td class="borderAll">463dk </td>
                            <td class="borderAll">18</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=18!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w18_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=18!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w18_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=18!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w18_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=18!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w18_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=18!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w18_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" rowspan="4">O odszkodowanie</td>
                            <td class="borderAll" rowspan="2">za mienie</td>
                            <td class="borderAll">nie powierzone</td>
                            <td class="borderAll">415 </td>
                            <td class="borderAll">19</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=19!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w19_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=19!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w19_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=19!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w19_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=19!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w19_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=19!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w19_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll">powierzone łącznie ze sprawami z tytułu odpowiedzialności wspólnej </td>
                            <td class="borderAll">416 </td>
                            <td class="borderAll">20</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=20!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w20_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=20!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w20_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=20!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w20_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=20!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w20_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=20!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w20_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="2">przysługujące pracodawcy w razie nieuzasadnionego rozwiązania przez pracownika umowy o pracę bez wypowiedzenia </td>
                            <td class="borderAll">417</td>
                            <td class="borderAll">21</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=21!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w21_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=21!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w21_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=21!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w21_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=21!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w21_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=21!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w21_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="2">z tytułu naruszenia przez pracownika zakazu konkurencji </td>
                            <td class="borderAll">418</td>
                            <td class="borderAll">22</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=22!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w22_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=22!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w22_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=22!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w22_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=22!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w22_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=22!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w22_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                        <tr>
                            <td class="borderAll" colspan="4">inne</td>
                            <td class="borderAll">23</td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=23!6!1!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w23_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=23!6!2!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w23_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=23!6!3!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w23_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=23!6!4!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w23_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                            <td class="borderAll bol_120 center"><a href="javascript:openPopup('popup.aspx?sesja=23!6!5!4')">
                                <asp:Label CssClass="normal" ID="tab_6_w23_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        </tr>
                </table>

                <br />
            </div>

            <div class="page-break">

                <strong>
                    <br />
                    Dział 7. </strong>Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe
		      <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td colspan="5" rowspan="2" class="borderTopLeft">SPRAWY z rep.</td>
                        <td colspan="7" class="borderTopLeftRight center">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                    </tr>
                    <tr>
                        <td class="center borderTopLeft">zbiorczo pow. 5 tomów (kol. od 2 do 7) </td>
                        <td class="center borderTopLeft">pow. 5 do 10 tomów</td>
                        <td class="center borderTopLeft">pow. 10 do 20 tomów </td>
                        <td class="center borderTopLeft">pow. 20 do 30 tomów </td>
                        <td class="center borderTopLeft">pow. 30 do 50 tomów </td>
                        <td class="center borderTopLeft">pow. 50 do 100 tomów </td>
                        <td class="center borderTopLeftRight">powyżej 100 tomów </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="borderTopLeft center">0</td>
                        <td class="center borderTopLeft">1</td>
                        <td class="center borderTopLeft">2</td>
                        <td class="center borderTopLeft">3</td>
                        <td class="center borderTopLeft">4</td>
                        <td class="center borderTopLeft">5</td>
                        <td class="center borderTopLeft">6</td>
                        <td class="center borderTopLeftRight">7</td>
                    </tr>
                    <tr>
                        <td rowspan="7" class="borderTopLeft col_36">U</td>
                        <td colspan="3" class="borderTopLeft wciecie">wpływ w okresie sprawozdawczym</td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                        <td colspan="2" class="borderTopLeft wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                        <td class="borderTopLeft col_36">03</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w03_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeft wciecie">załatwienie w okresie sprawozdawczym</td>
                        <td class="borderTopLeft col_36">04</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w04_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                        <td colspan="2" class="borderTopLeft wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                        <td class="borderTopLeft col_36">05</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w05_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                        <td class="borderTopLeft col_36">06</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w06_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeft wciecie">pozostało na następny okres sprawozdawczy</td>
                        <td class="borderTopLeft col_36">07</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w07_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="7" class="borderTopLeftBottom col_36">P</td>
                        <td colspan="3" class="borderTopLeft wciecie">wpływ w okresie sprawozdawczym</td>
                        <td class="borderTopLeft col_36">08</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w08_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                        <td colspan="2" class="borderTopLeft wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                        <td class="borderTopLeft col_36">09</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w09_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                        <td class="borderTopLeft col_36">10</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w10_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeft wciecie">załatwienie w okresie sprawozdawczym</td>
                        <td class="borderTopLeft col_36">11</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w11_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                        <td colspan="2" class="borderTopLeft wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                        <td class="borderTopLeft col_36">12</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w12_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                        <td class="borderTopLeft col_36">13</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w13_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeftBottom wciecie">pozostało na następny okres sprawozdawczy</td>
                        <td class="borderTopLeftBottom col_36">14</td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!1!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!2!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!3!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!4!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!5!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!6!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll  col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!7!4')">
                            <asp:Label CssClass="normal" ID="tab_7_w14_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>
                <br />
            </div>

            <div class="page-break">

                <strong>
                    <br />
                    Dział 9.1. </strong>Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)
		      <br />
                <br />

                <table style="width: 100%;">
                    <tr>
                        <td colspan="3" rowspan="2" class="borderTopLeft">Sprawy wg repertoriów</td>
                        <td colspan="4" class="borderTopLeftRight center">Liczba powołanych biegłych </td>
                    </tr>
                    <tr>
                        <td class="center col_200 borderTopLeft">Razem (kol. 2-4)</td>
                        <td class="center col_200 borderTopLeft">biegli sądowi</td>
                        <td class="center col_200 borderTopLeft">biegli spoza listy</td>
                        <td class="center col_200 borderTopLeftRight">inne podmioty</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeft">0</td>
                        <td class="center col_200 borderTopLeft">1</td>
                        <td class="center col_200 borderTopLeft">2</td>
                        <td class="center col_200 borderTopLeft">3</td>

                        <td class="center col_200 borderTopLeftRight">4</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">ogółem</td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!1!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!2!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!3!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!4!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeftBottom wciecie">w tym</td>
                        <td class="borderTopLeft wciecie">U</td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!1!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w02_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!2!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w02_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!3!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w02_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!4!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w02_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie">P</td>
                        <td class="borderTopLeftBottom col_36">03</td>
                        <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!1!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w03_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!2!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w03_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!3!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w03_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!4!4')">
                            <asp:Label CssClass="normal" ID="tab_91_w03_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>

                <br />
                <br />
            </div>
            <div class="page-break">

                <strong>
                    <br />
                    Dział 9.2. </strong>Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych)
		      <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td colspan="3" rowspan="3" class="borderTopLeft">Sprawy wg repertoriów</td>
                        <td colspan="8" class="borderTopLeftRight center">Liczba sporządzonych opinii</td>
                    </tr>
                    <tr>
                        <td class="center borderTopLeft" rowspan="2">razem (kol.1= 2 do 5 = 6 do 8)</td>
                        <td class="center borderTopLeft" rowspan="2">w ustalonym terminie</td>
                        <td class="center borderTopLeft" colspan="3">po ustalonym terminie</td>
                        <td class="center borderTopLeftRight" colspan="3">wg czasu wydania opinii</td>
                    </tr>
                    <tr>
                        <td class="center borderTopLeft">do 30 dni </td>
                        <td class="center borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td class="center borderTopLeft">pow. 3 miesięcy</td>
                        <td class="center borderTopLeft">do 30 dni </td>
                        <td class="center borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td class="center borderTopLeftRight">pow. 3 miesięcy</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderTopLeftRight">0</td>
                        <td class="center borderTopLeft">1</td>
                        <td class="center borderTopLeft">2</td>
                        <td class="center borderTopLeft">3</td>
                        <td class="center borderTopLeft">4</td>
                        <td class="center borderTopLeft">5</td>
                        <td class="center borderTopLeft">6</td>
                        <td class="center borderTopLeft">7</td>
                        <td class="center borderTopLeftRight">8</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">Ogółem</td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!1!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!2!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!3!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!4!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!5!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!6!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!7!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!8!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w01_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeftBottom wciecie">w tym</td>
                        <td class="borderTopLeft wciecie">U</td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!1!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!2!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!3!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!4!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!5!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!6!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!7!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!8!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w02_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie">P</td>
                        <td class="borderTopLeftBottom col_36">03</td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!1!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!2!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!3!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!4!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!5!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!6!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!7!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll  col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!8!4')">
                            <asp:Label CssClass="normal" ID="tab_92_w03_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>
                <br />
            </div>

            <div class="page-break">
                <strong>
                    <br />
                    Dział 9.3. </strong>Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo (z wył. tłumaczy przysięgłych)
		        <br />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td colspan="3" rowspan="2" class="borderAll center">SPRAWY z rep.</td>
                        <td colspan="4" class="borderAll center">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku </td>
                           <td colspan="8" class="borderAll center">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_81">razem
                            <br />
                            (kol.2-4)
                        </td>
                        <td class="borderAll center col_81">do 14 dni</td>
                        <td class="borderAll center col_81">pow. 14 do
                            <br />
                            30 dni</td>
                        <td class="borderAll center col_81">pow. powyżej miesiąca </td>
                        <td class="borderAll center col_81">razem<br />
                            (kol.2-4)
                        </td>
                        <td class="borderAll center col_81">do 14 dni</td>
                        <td class="borderAll center col_81">pow. 14 do 30 dni</td>
                        <td class="borderAll center col_81">razem powyżej miesiąca (kol. 9-12) </td>
                         <td class="borderAll center col_81">pow. 1 do 2 miesięcy </td>
                          <td class="borderAll center col_81">pow. 2 do 3 miesięcy </td>
                        <td class="borderAll center col_81">pow. 3 do 6 miesięcy </td>
                          <td class="borderAll center col_81">pow. 6 miesięcy </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="borderAll center">0</td>
                        <td class="borderAll center col_81">1</td>
                        <td class="borderAll center col_81">2</td>
                        <td class="borderAll center col_81">3</td>
                        <td class="borderAll center col_81">4</td>
                        <td class="borderAll center col_81">5</td>
                        <td class="borderAll center col_81">6</td>
                        <td class="borderAll center col_81">7</td>
                           <td class="borderAll center col_81">8</td>
                           <td class="borderAll center col_81">9</td>
                           <td class="borderAll center col_81">10</td>
                           <td class="borderAll center col_81">11</td>
                        <td class="borderAll center col_81">12</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderAll center">Ogółem</td>
                        <td class="borderAll center">01</td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                         <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!9!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c09" runat="server" Text="0"></asp:Label>
                        </a></td>
                         <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!10!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c10" runat="server" Text="0"></asp:Label>
                        </a></td>
                         <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!11!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c11" runat="server" Text="0"></asp:Label>
                        </a></td>
                         <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!12!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c12" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderAll center">w tym</td>
                        <td class="borderAll center">U</td>
                        <td class="borderAll center">02</td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c07" runat="server" Text="0"></asp:Label>
                        </a></td>

                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!9!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c09" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!10!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c10" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!11!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c11" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!12!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c12" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">P</td>
                        <td class="borderAll center">03</td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!9!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c09" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!10!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c10" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!11!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c11" runat="server" Text="0"></asp:Label>
                        </a></td>
                          <td class="borderAll center col_81"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!12!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c12" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>
                <br />
                <br />
            </div>

            <div class="page-break">
                <strong>
                    <br />
                </strong>
                <br />

                <table style="width: 100%;">
                    <tr>
                        <td>
                            <strong>Dział 10.1 </strong>Liczba powołań tłumaczy
                        </td>
                        <td>&nbsp;</td>
                        <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.1!1!4')">
                            <asp:Label CssClass="normal" ID="tab_101_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="page-break">
                <strong>Dział 10.2 </strong>Terminowość sporządzania tłumaczeń pisemnych

                 <br />

                <br />

                <table style="width: 100%;">
                    <tr>
                        <td colspan="8" class="borderAll center">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_140" rowspan="2">razem
                            <br />
                            (kol.1= 2 do 5 = 6 do 8)</td>
                        <td class="borderAll center col_140" rowspan="2">w ustalonym terminie</td>
                        <td class="borderAll center" colspan="3">po ustalonym terminie</td>
                        <td class="borderAll center" colspan="3">wg czasu wydania tłumaczenia </td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_140">do 30 dni</td>
                        <td class="borderAll center col_140">pow. 1 do 3 miesięcy</td>
                        <td class="borderAll center col_140">pow. 3 miesięcy</td>
                        <td class="borderAll center col_140">do 30 dni</td>
                        <td class="borderAll center col_140">pow. 1 do 3 miesięcy</td>
                        <td class="borderAll center col_140">pow. 3 miesięcy</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_140">1</td>
                        <td class="borderAll center col_140">2</td>
                        <td class="borderAll center col_140">3</td>
                        <td class="borderAll center col_140">4</td>
                        <td class="borderAll center col_140">5</td>
                        <td class="borderAll center col_140">6</td>
                        <td class="borderAll center col_140">7</td>
                        <td class="borderAll center col_140">8</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!1!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!2!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!3!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!4!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!5!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!6!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!7!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!8!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>

                <br />
            </div>

            <div class="page-break">
                <strong>Dział 10.3 </strong>Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo<br />

                <br />

                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center col_120" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                        <td class="borderAll center" colspan="8">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_120">razem (kol.2-4)</td>
                        <td class="borderAll center col_120">do 14 dni</td>
                        <td class="borderAll center col_120">pow. 14 do 30 dni</td>
                        <td class="borderAll center col_120">powyżej miesiąca</td>
                        <td class="borderAll center col_120">razem (kol. 6-8)</td>
                        <td class="borderAll center col_120">do 14 dni</td>
                        <td class="borderAll center col_120">pow. 14 do 30 dni</td>
                        <td class="borderAll center col_120">razem powyżej miesiąca (kol. 9-12) </td>
                        <td class="borderAll center col_120">pow. 1 do 2 miesięcy</td>
                        <td class="borderAll center col_120">pow. 2 do 3 miesięcy</td>
                        <td class="borderAll center col_120">pow. 3 do 6 miesięcy</td>
                        <td class="borderAll center col_120">pow. 6 miesięcy</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_120">1</td>
                        <td class="borderAll center col_120">2</td>
                        <td class="borderAll center col_120">3</td>
                        <td class="borderAll center col_120">4</td>
                        <td class="borderAll center col_120">5</td>
                        <td class="borderAll center col_120">6</td>
                        <td class="borderAll center col_120">7</td>
                        <td class="borderAll center col_120">8</td>
                        <td class="borderAll center col_120">9</td>
                        <td class="borderAll center col_120">10</td>
                        <td class="borderAll center col_120">11</td>
                        <td class="borderAll center col_120">12</td>
                    </tr>
                    <tr>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c01" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c02" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c03" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c04" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c05" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c06" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c07" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c08" runat="server" Text="0"></asp:Label>
                        </a></td>
                        <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!9!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c09" runat="server" Text="0"></asp:Label>
                        </a></td>
                         <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!10!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c10" runat="server" Text="0"></asp:Label>
                        </a></td>
                           <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!11!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c11" runat="server" Text="0"></asp:Label>
                        </a></td>
                           <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!12!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c12" runat="server" Text="0"></asp:Label>
                        </a></td>
                    </tr>
                </table>

                <br />
            </div>
            <div class="page-break">
                <strong>Dział 11 </strong>Obciążenia administracyjne respondentów

                 <br />
                <br />
                Proszę podać czas (w minutach) przeznaczony na:<br />
                <br />

                <table style="width: 100%;">
                    <tr>
                        <td class="col_100">&nbsp;</td>
                        <td>przygotowanie danych dla potrzeb wypełnianego formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>wypełnienie formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <br />
            </div>
            <div>
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
        </div>
           </div>
</asp:Content>