<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss6r.aspx.cs" Inherits="Statystyki_2018.mss6r" MaintainScrollPositionOnPostback="true" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" OnTick="TimerTick" Interval="2000">
    </asp:Timer>
    <div class="page-break">

        <br />
        <table style="width: 100%;">
            <tr>
                <td colspan="3" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
            </tr>
            <tr>
                <td class="borderAll col_33prc">Sąd Rejonowy
							<br />
                    <br />
                    w ..................................<br />
                    &nbsp;<br />
                </td>
                <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S6r<br />
                </span></strong>
                    <br />
                    <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                    <br />
                    z sądowego wykonywania orzeczeń
                            <br />
                    (według właściwości rzeczowej) </td>
                <td class="borderAll col_33prc" rowspan="2">Adresat:
							<br />
                    Ministerstwo Sprawiedliwości Departament Strategii i Funduszy Europejskich </td>
            </tr>
            <tr>
                <td class="borderAll col_33prc" rowspan="2">Okręg Sądu&nbsp;Apelacyjnego&nbsp;&nbsp;&nbsp;<br />
                    <br />
                    &nbsp;w ......................</td>
            </tr>
            <tr>
                <td class="center borderAll">
                    <table style="width: 100%;">
                        <tr>
                            <td rowspan="2">za</td>
                            <td>półrocze</td>
                            <td rowspan="2">20..</td>
                        </tr>
                        <tr>
                            <td>rok</td>
                        </tr>
                    </table>
                </td>
                <td class="borderAll col_33prc">Termin przekazania:
							<br />
                    do 10 dnia kalendarzowego po półroczu i roku<br />
                </td>
            </tr>
        </table>
        <br />
        <asp:Image ID="imgLoader" CssClass="center" Style="z-index: 99999; position: absolute; top: 250px; left: 600px; margin-right: auto;" runat="server" ImageUrl="~/img/ajax-loader.gif" />

        <asp:PlaceHolder runat="server" ID="tablePlaceHolder0"></asp:PlaceHolder>
        <br />
        &nbsp;&nbsp;&nbsp; *) w kol.1 sprawę (w01) i osobę (w02) wykazujemy tylko raz bez względu na liczbę orzeczonych przepadków przedmiotów, przedsiębiorstwa lub korzyści majątkowych; w wierszu w03 wykazujemy&nbsp;&nbsp;&nbsp;&nbsp; łączną kwotę orzeczonych przepadków przedmiotów, przedsiębiorstwa lub korzyści majątkowych
                <br />
        &nbsp;&nbsp;&nbsp; **) w kol.2 sprawę (w. 01) i osobę (w02) wykazujemy tylko raz bez względu na liczbę orzeczonych przepadków przedmiotów lub przedsiębiorstwa; w kolumnach od 3 do 13 wykazujemy wszystkie orzeczone przepadki przedmiotów lub przedsiębiorstwa; w wierszu w03 wykazujemy łączną kwotę orzeczonych przepadków przedmiotów lub przedsiębiorstwa *<br />
        &nbsp;&nbsp;&nbsp; **) w kol.14 sprawę (w. 01) i osobę (w02) wykazujemy tylko raz bez względu na liczbę orzeczonych przepadków korzyści majątkowych; w kolumnach od 15 do 22 wykazujemy wszystkie orzeczone przepadki korzyści majątkowych; w wierszu w03 wykazujemy łączną kwotę orzeczonych przepadków korzyści majątkowych
                <br />
        <strong>Przykłady:</strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • Jeżeli w jednej sprawie orzeczono w stosunku do jednej osoby zarówno przepadek przedmiotów na podstawie art. 44 § 1 kk jak i przepadek korzyści majątkowej na podstawie art. 45 § 1 kk to w wierszu 1 wykazujemy jedną sprawę w kolumnach 1, 2, 3, 14 i 15. Analogicznie należy wykazać osoby w wierszu 2.
                <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • Jeżeli w jednej sprawie osądzono dwie osoby, z czego wobec jednej orzeczono przepadek przedmiotów na podstawie art. 44 § 1 kk, a wobec drugiej orzeczono przepadek korzyści majątkowej na podstawie art. 45 § 1 kk to w wierszu 1 wykazujemy jedną sprawę w kolumnach 1, 2, 3, 14 i 15, natomiast w wierszu 2 w kolumnie 1 dwie osoby, a w kolumnach 2, 3, 14 i 15 po jednej osobie.
                <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • Jeżeli w jednej sprawie osądzono trzy osoby, z czego wobec jednej orzeczono przepadek przedmiotów na podstawie art. 44 § 1 kk i art. 70 ust. z dn. 29 lipca 2005 r. o przeciwdziałaniu narkomanii, wobec drugiej orzeczono przepadek korzyści majątkowej na podstawie art. 45 § 1 kk, a wobec trzeciej orzeczono przepadek przedmiotów na podstawie art. 44 § 1 kk to w wierszu 1 wykazujemy jedną sprawę w kolumnach 1, 2, 3, 10, 14 i 15, natomiast w wierszu 2 w kolumnie 1 - trzy osoby, w kolumnach 2 i 3 – 2 osoby, a w kolumnach 10, 14 i 15 po jednej osobie.
                <br />
        <br />

        <div class="page-break" style="margin: auto; width: 1150px">
            <asp:PlaceHolder runat="server" ID="PlaceHolder1_waski"></asp:PlaceHolder>
        </div>
        <div class="page-break">
            <br />
            <br />

            <asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break" style="margin: auto; width: 1150px">
            <strong>
                <br />
                <br />
                Dział 2.      </strong>Kwoty świadczeń pieniężnych lub nawiązek, do których sąd zobowiązał w trybie: (podaje się pełne złote, bez groszy)<br />
            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">

            <strong>
                <br />
            </strong>
            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">

            <strong>
                <br />
            </strong>
            <br />

            <strong>Dział 7. Orzekane środki karne, środki kompensacyjne i środki probacyjne </strong>&nbsp;&nbsp;<br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <br />

            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder06"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder07"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">

            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder08"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder09"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder10"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <br />

            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder11"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div>
            &nbsp;<table style="width: 100%;">
                <tr>
                    <td style="width: 50%">Wyjaśnienia dotyczące sprawozdania można
uzyskać pod numerem telefonu</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 50%">
                        <br />
                        <br />
                        ...........................................</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 50%">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 50%">...........................................</td>
                    <td>
                        <br />
                        <br />
                        ...........................................</td>
                </tr>
                <tr>
                    <td style="width: 50%">(miejscowość i data)          </td>
                    <td>(pieczątka i podpis osoby sporządzającej) </td>
                </tr>
                <tr>
                    <td style="width: 50%">
                        <br />
                        <br />
                        <br />
                        ...........................................</td>
                    <td>
                        <br />
                        <br />
                        <br />
                        ...........................................</td>
                </tr>
                <tr>
                    <td style="width: 50%">(miejscowość i data)          </td>
                    <td>(pieczątka i podpis przewodniczącego wydziału) </td>
                </tr>
                <tr>
                    <td style="width: 50%">
                        <br />
                        <br />
                        <br />
                        ...........................................</td>
                    <td>
                        <br />
                        <br />
                        <br />
                        ...........................................</td>
                </tr>
                <tr>
                    <td style="width: 50%">(miejscowość i data)          </td>
                    <td>(pieczątka i podpis prezesa sądu)</td>
                </tr>
            </table>
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
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">
    </div>
</asp:Content>