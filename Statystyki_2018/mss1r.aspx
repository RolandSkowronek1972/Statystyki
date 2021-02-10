<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss1r.aspx.cs" Inherits="Statystyki_2018.mss1r" %>

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

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;">

        <div id="tabela1" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
            &nbsp;</div>

        <div style="margin: 0 auto 0 auto;">

        

            <div>

                <div id="Div2" style="z-index: 10;">
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                        <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                        <br />
                    </div>
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                        <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
                    </div>
                      <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc" colspan="2">Sąd Rejonowy<br />
                            w ..................................<br />
&nbsp;<br />
                        </td>
                        <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S1r<br />
                            </span></strong>
                            <br />
                            <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                            <br />
                            w sprawach cywilnych</td>
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
                        <td class="borderAll col_15prc">Okręgowego
                            <br />
                            w ......................</td>
                        <td class="borderAll col_15prc">Apelacyjnego<br />
&nbsp;w ......................</td>
                        <td class="center borderAll">
                            za … kwartał …**) 20… r.</td>
                        <td class="borderAll col_33prc">Sprawozdanie należy przekazać adresatom w terminie:<br />
&nbsp;1. do 9 dnia kalendarzowego po półroczu i roku
                            <br />
&nbsp;2. do 14 dnia kalendarzowego po półroczu i roku</td>
                    </tr>
                    </table>
                <br />
                    <asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
                    <!-- 1 -->

                    <table cellpadding="0" cellspacing="0" style="width: 75%;">
                        <tr>
                            <td colspan="2"><strong>Dział 1.1.a.</strong> 1) sprawy o opróżnienie lokalu mieszkalnego z orzeczeniem</td>
                        </tr>
                        <tr>
                            <td class="wciecie">prawa do lokalu socjalnego</td>
                            <td class="borderAll center col_120">
                                <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_11a_w01_c01" runat="server" Text="0"></asp:Label></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="wciecie">bez prawa do lokalu socjalnego</td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_11a_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class="wciecie">2) bez orzeczenia o prawie do lokalu socjalnego</td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_11a_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class="wciecie">3) Liczba lokali socjalnych przyznanych orzeczeniem</td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_11a_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>
                <!--1.1.2-->

                <div id="11f" class="page-break">
                    <strong>Dział 1.1.f</strong> Sprawy, w których doszło do nabycia nieruchomości przez cudzoziemców na podstawie prawomocnego orzeczenia sądowego [art.8a ust. 2 ustawy z dnia 24 marca 1920r. o nabywaniu nieruchomości przez cudzoziemców (Dz.U. z 2017 r. poz. 2278)] – załatwienia (dotyczy wszystkich urządzeń ewidencyjnych).
                       <br />
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!1!4')">
                                <asp:Label CssClass="normal" ID="tab_11f_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <strong>UWAGA <em>: w każdej sprawie, w której zapadło prawomocne orzeczenie o nabyciu (zarówno w postępowaniu procesowym jak i nieprocesowym) nieruchomości przez cudzoziemca przesyła się niezwłocznie odpis orzeczenia do MSW. Przez nabycie należy rozumieć każdy rodzaj orzeczenia, na podstawie którego cudzoziemiec stał się właścicielem nieruchomości, np. w trybie zniesienia współwłasności, działu spadku, podziału majątku, zasiedzenia, ustalenia własności, uzgodnienia treści księgi wieczystej itd.
                       <br />
                        <br />
                    </em></strong>
                </div>
                <div id="11g" class="page-break">
                    <strong>Dział 1.1.g</strong> Przyznanie kompensaty (ustawa z 7 lipca 2005 r. o państwowej kompensacie przysługującej ofiarom niektórych czynów zabronionych) (Dz. U. z 2016 r., poz. 325)

                      <br />
                    <table style="width: 100%;">
                        <tr>
                            <td class="col_300">- Liczba spraw, w których przyznano kompensatę </td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!1!4')">
                                <asp:Label CssClass="normal" ID="tab_11g_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_300">Łączna wysokość przyznanych kompensat (zł) (wartość w zaokrągleniu w górę do pełnego złotego)</td>
                            <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!2!4')">
                                <asp:Label CssClass="normal" ID="tab_11g_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                </div>
                  &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>
                <div id="1.1.1" class="page-break">
                    <div id='Sprawy mediacyjne' class="page-break">
                        <br />
                        <strong>Dział 1.1.1 </strong>
                        Sprawy mediacyjne
                        <table style="width: 100%;">
                            <tr>
                                <td class="center borderAll" colspan="5" style="width: 40%">Sądowe</td>
                                <td class="center borderAll" style="width: 10%">Liczba</td>
                                <td class="center borderAll" colspan="2" style="width: 40%">Pozasądowe</td>
                                <td class="center borderAll" style="width: 50%" tabindex="width: 10%">Liczba</td>
                            </tr>
                            <tr>
                                <td class="center borderAll" colspan="5" style="width: 50%">0</td>
                                <td class="col_120 borderAll center" style="width: 10%">1</td>
                                <td class="center borderAll" colspan="2">0</td>
                                <td class="col_120 borderAll center" tabindex="width: 10%">1</td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie col_65" rowspan="5">Wpływ</td>
                                <td class="borderAll wciecie col_60" rowspan="5">Liczba</td>
                                <td class="borderAll wciecie" rowspan="3">spraw w których</td>
                                <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc)</td>
                                <td class="borderAll col_36" style="width: 36px">1</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="wciecie borderAll">Liczba wniosków o zatwierdzenie ugody złożonych przez stronę</td>
                                <td class="col_36 center borderAll">14</td>
                                <td class="col_120 borderAll center" tabindex="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                                <td class="borderAll col_36" style="width: 36px">2</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="wciecie borderAll">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 13 § 1 kpc)</td>
                                <td class="col_36 center borderAll">15</td>
                                <td class="col_120 borderAll center" tabindex="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 8 § 1 kpc)</td>
                                <td class="borderAll col_36" style="width: 36px">3</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td colspan="3" rowspan="6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja)</td>
                                <td class="borderAll col_36" style="width: 36px">4</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 13 § 2 kpc)</td>
                                <td class="borderAll col_36" style="width: 36px">5</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie col_65" rowspan="8">Rozstrzygnięcie przed </td>
                                <td class="borderAll wciecie col_60" rowspan="3">mediatorem</td>
                                <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 8 § 1 kpc) - liczba </td>
                                <td class="borderAll wciecie">ugód zawartych przed mediatorem</td>
                                <td class="borderAll col_36" style="width: 36px">6</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                                <td class="borderAll col_36" style="width: 36px">7</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                                <td class="borderAll col_36" style="width: 36px">8</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie col_60" rowspan="5">sądem</td>
                                <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)</td>
                                <td class="borderAll col_36" style="width: 36px">9</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="wciecie borderAll">Zatwierdzono ugodę</td>
                                <td class="col_36 center borderAll">16</td>
                                <td class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc</td>
                                <td class="borderAll col_36" style="width: 36px">10</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="wciecie borderAll">Nadano klauzulę wykonalności w trybie (art. 183 14 § 2 kpc)</td>
                                <td class="col_36 center borderAll">17</td>
                                <td class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 14 § 1 i 2 kpc)</td>
                                <td class="borderAll col_36" style="width: 36px">11</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="wciecie borderAll">Odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc)</td>
                                <td class="col_36 center borderAll">18</td>
                                <td class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc</td>
                                <td class="borderAll col_36" style="width: 36px">12</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td colspan="3" rowspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc)</td>
                                <td class="borderAll col_36" style="width: 36px">13</td>
                                <td class="col_120 borderAll center" style="width: 10%"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_111_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>
              
               
           &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder05"></asp:PlaceHolder>
                <div id="Div11" class="page-break">
                    &nbsp;<asp:Label ID="tabela4Label" runat="server"></asp:Label>
                    &nbsp;
    &nbsp;<br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td colspan="3" rowspan="2" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="borderAll center">Sprawy wg. repetytoriów</td>
                            <td colspan="4" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" align="center">Liczba powołanych biegłych</td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">Razem kol. (2-4)</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">biegli sądowi</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">biegli z poza listy </td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" align="center">inne podmioty</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" align="center">0</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">1</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">2</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">3</td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" align="center">4</td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" colspan="2">Ogółem</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" align="center">01</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" align="center" rowspan="3">w tym </td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">C</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;" align="center">02</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">CG-G</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;" align="center">03</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Ns</td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" align="center">04</td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>

                <br />
                <div id="Div11" class="page-break">
                    &nbsp;<asp:Label ID="tabela5Label" runat="server"></asp:Label>
                    &nbsp; <br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="3" rowspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Sprawy wg. repetytorów</td>
                            <td align="center" class="" colspan="8" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Lista sporządzonych opinii</td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">razem<br />
                                (kol. 1=2 do 5=6 do 8)</td>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">w ustawowym<br />
                                terminie</td>
                            <td align="center" class="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">po ustalonym terminie</td>
                            <td align="center" class="center" colspan="3" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">wg. czasu wydania opinii</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 1 do&nbsp; 3<br />
                                miesięcy.</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 3<br />
                                miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 1 do&nbsp; 3<br />
                                miesięcy.</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">pow. 3<br />
                                miesięcy</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">8</td>
                        </tr>
                        <tr>
                            <td align="justify" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Ogółem</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="3" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;">w tym</td>
                            <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">C</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">CG-G</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">03</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Ns</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;">04</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                    &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder06"></asp:PlaceHolder>
        
                <div>

                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 1000px"><strong>Dział 8.1 Liczba powołań tłumaczy </strong></td>
                            <td align="center" style="border: thin solid #000000">
                                <a href="javascript:openPopup('popup.aspx?sesja=1!8.1!1!4')">
                                    <asp:Label ID="tab_81_w01_c01" runat="server" Text="0" CssClass="normal"></asp:Label>
                                </a>
                            </td>
                        </tr>
                    </table>
                    <br />

                    <asp:Label ID="tabela7Label" runat="server"></asp:Label>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="8" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Liczba sporządzonych tłumaczeń pisemnych</td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">Razem<br />
                                (kol.1=kol. 2 do 6)</td>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">w ustalonym terminie</td>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">po ustalonym terminie</td>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">wg. czasu wydania tłumaczenia</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 1 do 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 1 do 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">pow. 3 miesięcy</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">8</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div>
                    <br />
                    <asp:Label ID="tabela8Label" runat="server"></asp:Label>
                    &nbsp;<table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td  colspan="4" class="borderAll center">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                            <td  colspan="8" class="borderAll center">Skierowanie rachunku&nbsp;do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                        </tr>
                        <tr>
                            <td  class="borderAll center col_120">Razem<br />
                                (kol. 2 do 4)</td>
                            <td  class="borderAll center col_120">do 14 dni</td>
                            <td  class="borderAll center col_120">pow.14 do 30 dni</td>
                            <td  class="borderAll center col_120">powyżej miesiąca</td>
                            <td  class="borderAll center col_120">razem (kol. 6 do 8)</td>
                            <td  class="borderAll center col_120">do 14 dni</td>
                            <td  class="borderAll center col_120">pow. 14 do 30 dni</td>
                            <td  class="borderAll center col_120">razem powyżej miesiąca (kol. 9-12)</td>
                            <td  class="borderAll center col_120">pow. 1 do 2 miesięcy</td>
                            <td  class="borderAll center col_120">pow. 2 do 3 miesięcy </td>
                            <td  class="borderAll center col_120">pow. 3 do 6 miesięcy</td>
                            <td  class="borderAll center col_120">pow. 6 miesięcy</td>
                        </tr>
                        <tr>
                            <td  class="borderAll center col_120">1</td>
                            <td  class="borderAll center col_120">2</td>
                            <td  class="borderAll center col_120">3</td>
                            <td  class="borderAll center col_120">4</td>
                            <td  class="borderAll center col_120">5</td>
                            <td  class="borderAll center col_120">6</td>
                            <td  class="borderAll center col_120">7</td>
                            <td class="borderAll center col_120">8</td>
                            <td class="borderAll center col_120">9</td>
                            <td class="borderAll center col_120">10</td>
                            <td class="borderAll center col_120">11</td>
                            <td class="borderAll center col_120">12</td>
                        </tr>
                        <tr>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                             <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!9!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                            <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!10!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                             <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!11!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                           <td  class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!12!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div id="debag">

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
        </div>
    </div>
</asp:Content>