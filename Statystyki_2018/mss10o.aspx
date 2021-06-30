<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss10o.aspx.cs" Inherits="Statystyki_2018.mss10o" MaintainScrollPositionOnPostback="true" %>

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

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="debag">

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
                        <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S10o<br />
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

                <asp:PlaceHolder runat="server" ID="tablePlaceHolder0"></asp:PlaceHolder>
                <br />
            </div>

            <br />

            <div class="page-break">
                <strong>
                    <br />
                    Dział 4. </strong>Wykonywanie kary ograniczenia wolności i wykonywanie pracy społecznie użytecznej orzekanej w zamian za nieuiszczoną grzywnę<br />
                <br />

                <asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
                <br />
            </div>

            <div class="page-break">
                <strong>Dział 5.      </strong>Wykonywanie kary pozbawienia wolności oraz środków karnych w systemie dozoru elektronicznego (s.d.e)

				 <br />
                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>
                <br />
            </div>

            <div class="page-break">

                <strong>
                    <br />
                    Dział 6. </strong>Wykonywanie warunkowego zawieszenia wykonania kary<br />

                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>
                <br />
            </div>

            <div class="page-break">

                <strong>
                    <br />
                    Dział 7. </strong>Wykonywanie warunkowego przedterminowego zwolnienia<br />

                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>
                <br />
            </div>
            <div class="page-break">

                <strong>
                    <br />
                    Dział 8. </strong>Wykonywanie orzeczeń w przedmiocie środków zabezpieczających<br />

                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder05"></asp:PlaceHolder>
                <br />
            </div>
            <div class="page-break">

                <strong>
                    <br />
                    Dział 9. </strong>Przerwa w wykonywaniu kary pozbawienia wolności – art. 153 kkw<br />

                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder06"></asp:PlaceHolder>
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
            </div>
            <div>
                &nbsp;<table style="width:100%;">
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
                        <td style="width: 50%">     (miejscowość i data)          </td>
                        <td> (pieczątka i podpis osoby sporządzającej) </td>
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
                        <td style="width: 50%">     (miejscowość i data)          </td>
                        <td>    (pieczątka i podpis przewodniczącego wydziału) </td>
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
                        <td style="width: 50%">     (miejscowość i data)          </td>
                        <td>    (pieczątka i podpis prezesa sądu)</td>
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
</asp:Content>