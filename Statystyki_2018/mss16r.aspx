<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss16r.aspx.cs" Inherits="Statystyki_2018.mss16r" %>

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
                            <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;">

        <div id="tabela1" style="z-index: 10; visibility: hidden;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
         
        </div>

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>

            <br />
            <table style="width: 100%;">
                <tr>
                    <td colspan="4" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                </tr>
                <tr>
                    <td class="borderAll col_33prc" colspan="2">Sąd Rejonowy w ..................................<br />
                      <br />
                    </td>
                    <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S16r<br />
                    </span></strong>
                        <br />
                        <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                        <br />
                        w sprawach rodzinnych i nieletnich  </td>
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
                    <td class="borderAll col_15prc">&nbsp;&nbsp;&nbsp; Okręgowego
                            <br />
                        w ......................</td>
                    <td class="borderAll col_15prc">&nbsp;&nbsp; Apelacyjnego&nbsp;&nbsp;&nbsp; w ......................</td>
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
                    <td class="borderAll col_33prc">
                        <br />
                        Sprawozdanie należy przekazać adresatom w terminie:<br />
                        &nbsp;&nbsp; 1. do 9 dnia kalendarzowego po półroczu i roku
                            <br />
                        &nbsp;&nbsp; 2. do 14 dnia kalendarzowego po półroczu i roku<br />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
        <div id='111a' class="page-break">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 700px">

                        <strong>Dział 1.1.1.a </strong>w tym liczba orzeczonych zakładów leczenia odwykowego: </td>
                    <td class="col_220">stacjonarnych</td>
                    <td class="center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a!1!4')">
                            <asp:Label ID="tab_111a_w01_c01" runat="server" ReadOnly="True" CssClass="col_155">0</asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px"></td>
                    <td class="col_220 ">nie stacjonarnych</td>
                    <td class="center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.a!1!4')">
                            <asp:Label ID="tab_111a_w02_c01" runat="server" ReadOnly="True" CssClass="col_155">0</asp:Label></a>
                    </td>
                </tr>
            </table>
        </div>

        <div id='111a1' class="page-break">
            <br />
            <strong>Dział 1.1.1.a.1 </strong>
            Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których nastąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546)]
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="6">Liczba spraw, w których nastąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego</td>
        </tr>
        <tr>
            <td class="center borderAll">razem (kol. 2 do 6)</td>
            <td class="center borderAll">do 7 dni</td>
            <td class="center borderAll">powyżej 7 do 14 dni</td>
            <td class="center borderAll">powyżej 14 do 21 dni</td>
            <td class="center borderAll">powyżej 21 do 30 dni</td>
            <td class="center borderAll">ponad 30 dni</td>
        </tr>
        <tr>
            <td class="center borderAll">1</td>
            <td class="center borderAll">2</td>
            <td class="center borderAll">3</td>
            <td class="center borderAll">4</td>
            <td class="center borderAll">5</td>
            <td class="center borderAll">6</td>
        </tr>
        <tr>

            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_111a1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <div id="1.1.1.a.2." class="page-break">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px">

                        <strong>Dział 1.1.1.a.2.</strong> Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2017 r., poz. 882)
                    </td>
                    <td class="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.2!1!4')">
                            <asp:TextBox ID="tab_111a2_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px">

                        <strong>Dział 1.1.1.b.</strong> w tym (dz. 1.1.1. w. 47 lit. b) orzeczono przysposobienie, na które rodzice wcześniej wyrazili zgodę</td>
                    <td class="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!1!4')">
                            <asp:TextBox ID="tab_111b_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px">

                        <strong>Dział 1.1.1.c</strong>. w tym (dz. 1.1.1. w. 47 lit. c) przez osoby zamieszkałe za granicą</td>
                    <td class="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')">
                            <asp:TextBox ID="tab_111c_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <br />

            <strong>Dział 1.1.1.d</strong>. Przysposobienie według wieku małoletnich (liczby osób)<br />
            <br />
            <div id='1.1.1.d'>
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center" colspan="2" rowspan="2">Małoletni według wieku </td>
                        <td class="borderAll center" rowspan="2">Ogółem orzeczone </td>
                        <td class="borderAll center" colspan="2">w tym </td>
                    </tr>
                    <tr>
                        <td class="borderAll center">blankietowe </td>
                        <td class="borderAll center">przez osoby zamieszkałe za granicą </td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="2">0</td>
                        <td class="col_166 center borderAll ">1</td>
                        <td class="col_166 center borderAll ">2</td>
                        <td class="col_166 center borderAll ">3</td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Razem (w. 02 do 17)</td>
                        <td class="borderAll col_36">1</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Do roku</td>
                        <td class="borderAll col_36">2</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. roku do 2 lat </td>
                        <td class="borderAll col_36">3</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 2 do 3 lat </td>
                        <td class="borderAll col_36">4</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 3 do 4 lat </td>
                        <td class="borderAll col_36">5</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 4 do 5 lat </td>
                        <td class="borderAll col_36">6</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 5 do 6 lat </td>
                        <td class="borderAll col_36">7</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 6 do 7 lat </td>
                        <td class="borderAll col_36">8</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 7 do 8 lat </td>
                        <td class="borderAll col_36">9</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 8 do 9 lat </td>
                        <td class="borderAll col_36">10</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 9 do 10 lat </td>
                        <td class="borderAll col_36">11</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 10 do 11 lat </td>
                        <td class="borderAll col_36">12</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 11 do 12 lat </td>
                        <td class="borderAll col_36">13</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 12 do 13 lat </td>
                        <td class="borderAll col_36">14</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 13 do 14 lat </td>
                        <td class="borderAll col_36">15</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Pow. 14 do 15 lat </td>
                        <td class="borderAll col_36">16</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_200 borderAll ">Ponad 15 lat </td>
                        <td class="borderAll col_36">17</td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!3!4')">
                            <asp:Label CssClass="normal" ID="tab_111d_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
            </div>
            <br />

            <strong>Dział 1.1.1.e.</strong> Pozbawienie, zawieszenie, ograniczenie władzy rodzicielskiej
         <div id='1.1.1.e'>
             <table style="width: 100%;">
                 <tr>
                     <td class="borderAll center" colspan="3">Wyszczególnienia</td>
                     <td class="borderAll center">Liczba spraw (Dział 1.1.1 w.48 rubr. 5) </td>
                     <td class="borderAll center">Liczba małoletnich, których sprawa dotyczy (Dział 1.1. w.48 rubr. 6 ) </td>
                 </tr>
                 <tr>
                     <td class="borderAll center" colspan="3">0</td>
                     <td class="borderAll center">1</td>
                     <td class="borderAll center">2</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Razem (w. 01= w.02+05+06) </td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Pozbawienie władzy rodzicielskiej </td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderLeft"></td>
                     <td class="borderTopBottom">w tym ze względu na stosowanie przemocy w rodzinie w rozumieniu art. 2 pkt 2 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderLeft"></td>
                     <td class="borderTopBottom">w tym z uwagi na powiadomienie sądu opiekuńczego przez pracownika socjalnego o odebraniu dziecka z rodziny w trybie art. 12a ust. 1 w zw. z ust. 4 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Zawieszenie władzy rodzicielskiej </td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td colspan="2" class="borderAll wciecie">Ograniczenie władzy rodzicielskiej </td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderLeft"></td>
                     <td class="borderTopBottom">w tym ze względu na stosowanie przemocy w rodzinie w rozumieniu art. 2 pkt 2 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderLeft"></td>
                     <td class=" borderTopBottom">w tym z uwagi na powiadomienie sądu opiekuńczego przez pracownika socjalnego o odebraniu dziecka z rodziny w trybie art. 12a ust. 1 w zw. z ust. 4 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
                     <td class="borderAll col_36">8</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w08_c02" runat="server" Text="0"></asp:Label></a>
                         <br />
                     </td>
                 </tr>
                 <tr>
                     <td class="borderLeft"></td>
                     <td class="borderAll">w tym orzeczenie przez sąd pieczy naprzemiennej (art. 107§1 i 2 kro) </td>
                     <td class="borderAll col_36">9</td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.e!1!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.e!2!4')">
                         <asp:Label CssClass="normal" ID="tab_111e_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
             </table>
         </div>

            <br />

            <strong>Dział 1.1.1.f.</strong> w tym (dz. 1.1.1. w. 48 lit. f)<div id='1.1.1.f'>
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center" colspan="2">Wyszczególnienie</td>
                        <td class="col_330 center borderAll ">Liczby</td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="2">0</td>
                        <td class="col_330 center borderAll ">1</td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">Liczba ojców, którzy złożyli wniosek o powierzenie wykonywania władzy rodzicielskiej </td>
                        <td class="borderAll col_36">1</td>
                        <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111f_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">w tym liczba ojców, których wniosek sąd uwzględnił </td>
                        <td class="borderAll col_36">2</td>
                        <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111f_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">Liczba matek, które złożyły wniosek o powierzenie wykonywania władzy rodzicielskiej </td>
                        <td class="borderAll col_36">3</td>
                        <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111f_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">w tym liczba matek, których wniosek sąd uwzględnił </td>
                        <td class="borderAll col_36">4</td>
                        <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111f_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">Liczba spraw, w których rodzice przedstawili porozumienie o sposobie wykonywania władzy rodzicielskiej i utrzymywaniu kontaktów z dzieckiem </td>
                        <td class="borderAll col_36">5</td>
                        <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.f!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111f_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll">w tym liczba spraw, w których sąd uwzględnił porozumienie </td>
                        <td class="borderAll col_36">6
    <td class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.f!1!4')">
        <asp:Label CssClass="normal" ID="tab_111f_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
            </div>

            <br />
            <div id='1.1.1.g'>

                <strong>Dział 1.1.1.g. </strong>
                <h3 class="western"><font size="2">Rodzaje orzeczeń wydanych w okresie statystycznym w sprawach dotyczących wykonywania kontaktów z dzieckiem (art. 598</font><sup><font size="2">15 </font></sup>i nast. K.p.c.)</h3>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center" colspan="2" rowspan="2">Wyszczególnienia</td>
                        <td class="borderAll center" colspan="2">Liczby</td>
                    </tr>
                    <tr>
                        <td class="col_90 center borderAll">rodziców</td>
                        <td class="col_90 center borderAll">orzeczeń</td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="2">0</td>
                        <td class="col_90 center borderAll">1</td>
                        <td class="col_90 center borderAll">2</td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Razem (w. 02, 05, 08,11)</td>
                        <td class="borderAll col_36">1</td>
                        <td class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Orzeczenie, w którym zagrożono osobie, pod której pieczą dziecko pozostaje, niewykonującej (albo niewłaściwie wykonującej) obowiązki wynikające z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59815 § 1 k.p.c.) nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem </td>
                        <td class="borderAll col_36">2</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba ojców, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem w sytuacjach wskazanych w w. 02 </td>
                        <td class="borderAll col_36">3</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba matek, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem w sytuacjach wskazanych w w. 02 </td>
                        <td class="borderAll col_36">4</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Orzeczenie, w którym zagrożono osobie uprawnionej do kontaktu z dzieckiem albo osobie, której tego kontaktu zakazano, naruszających obowiązki wynikające z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59815 § 2 k.p.c.) nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje </td>
                        <td class="borderAll col_36">5</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba ojców, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje w sytuacjach wskazanych w w. 05 </td>
                        <td class="borderAll col_36">6</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba matek, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje w sytuacjach wskazanych w w. 05 </td>
                        <td class="borderAll col_36">7</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Orzeczenie, którym nakazano osobom wymienionym w w. 02 lub 05 zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
                        <td class="borderAll col_36">8</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba ojców, w sytuacjach wymienionych w w. 02 lub 05, którym nakazano zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
                        <td class="borderAll col_36">9</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba matek, w sytuacjach wymienionych w w. 02 lub 05, którym nakazano zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
                        <td class="borderAll col_36">10</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Orzeczenie, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, jeżeli do kontaktu nie doszło wskutek niewykonania lub niewłaściwego wykonania przez osobę, pod której pieczą dziecko pozostaje, obowiązków wynikających z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59817 § 1 k.p.c.) oraz naruszenia przez uprawnionego do kontaktu z dzieckiem obowiązków dotyczących kontaktu, wynikających z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem (art. 59817 § 2 k.p.c.) </td>
                        <td class="borderAll col_36">11</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba ojców, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, w sytuacjach wymienionych w w.11</td>
                        <td class="borderAll col_36">12</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_300 wciecie borderAll ">Liczba matek, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, w sytuacjach wymienionych w w.11 </td>
                        <td class="borderAll col_36">13</td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.g!1!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.g!2!4')">
                            <asp:Label CssClass="normal" ID="tab_111g_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
            </div>

            <br />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px">

                        <strong>Dział 1.1.1.g.1</strong>. </td>
                    <td class="center"></td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px" class="wciecie">Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5981- 5985 kpc </td>
                    <td class="center">

                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g.1!1!4')">
                            <asp:TextBox ID="tab_111g1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px" class="wciecie">Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5986- 59812 kpc w zw. z art. 59813 </td>
                    <td class="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g.1!1!4')">
                            <asp:TextBox ID="tab_111g1_w02_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <br />

            <br />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px">
                        <p style="margin-bottom: 0cm">
                            <strong>Dział 1.1.1.h</strong> Liczba zarządzeń sędziego o natychmiastowe wypisanie ze szpitala psychiatrycznego i umorzenie postępowania [art. 45 ust. 2 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546)]
                        </p>
                    </td>
                    <td valign="bottom" class="center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.h!1!4')">
                            <asp:TextBox ID="tab_111h1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>

        <strong>
            <br />
        </strong>
        <br />
        <div id='1.1.2.a'>

            <strong>Dział 1.1.2.a </strong>&nbsp;Ewidencja popełnionych czynów karalnych przez nieletnich w odniesieniu do osób

   <table style="width: 100%;">
       <tr>
           <td class="col_100 borderAll " rowspan="4">Wyszczególnienia</td>
           <td class="borderAll col_36" rowspan="4">L.p.</td>
           <td class="col_90 center borderAll " rowspan="4">Wszczęto</td>
           <td class="borderAll center" colspan="5">Załatwiono</td>
           <td class="borderAll center" colspan="2">czyny karalne</td>
       </tr>
       <tr>
           <td class="col_90 center borderAll " rowspan="3">razem (kol. 2= 3 do 6) </td>
           <td class="borderAll center" colspan="4">z tego</td>
           <td class="col_90 center borderAll " rowspan="3">wydano orzeczenie kończące postępowanie</td>
           <td class="col_90 center borderAll " rowspan="3">stwierdzone czyny karalne przypisane nieletniemu w orzeczeniu kończącym postępowanie (wszystkie czyny) </td>
       </tr>
       <tr>
           <td class="col_90 center borderAll " rowspan="2">nie wszczęto </td>
           <td colspan="2">umorzono z powodu </td>
           <td class="col_90 center borderAll " rowspan="2">w inny sposób</td>
       </tr>
       <tr>
           <td class="col_90 center borderAll ">niecelowości ze wzgl. na orzeczone środki w innej sprawie</td>
           <td class="col_90 center borderAll ">innego</td>
       </tr>
       <tr>
           <td class="borderAll center" colspan="2">0</td>
           <td class="col_90 center borderAll ">1</td>
           <td class="col_90 center borderAll ">2</td>
           <td class="col_90 center borderAll ">3</td>
           <td class="col_90 center borderAll ">4</td>
           <td class="col_90 center borderAll ">5</td>
           <td class="col_90 center borderAll ">6</td>
           <td class="col_90 center borderAll ">7</td>
           <td class="col_90 center borderAll ">8</td>
       </tr>
       <tr>
           <td class="col_100 borderAll ">Rep Nkd</td>
           <td class="borderAll col_36">1</td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!1!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!2!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!3!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!4!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c04" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!5!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c05" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!6!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c06" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!7!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c07" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!8!4')">
               <asp:Label CssClass="normal" ID="tab_112a_w01_c08" runat="server" Text="0"></asp:Label></a></td>
       </tr>
   </table>
        </div>

        <br />

        <strong>Dział 1.1.2.b </strong>&nbsp;Stwierdzone czyny karalne przypisane nieletniemu w orzeczeniu kończącym postępowanie
        <div id='1.1.2.b'>
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" colspan="4">Rodzaje czynów karalnych </td>
                    <td class="col_90 center borderAll ">Liczba stwierdzonych czynów karalnych </td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="4">0</td>
                    <td class="col_90 center borderAll ">1</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="3">Ogółem (w.01 = dz.1.1.2.a, kol. 8)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="23">w tym</td>
                    <td class="borderAll center" colspan="2">zabójstwo art. 148 kk</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">uszczerbek na zdrowiu art.</td>
                    <td class="borderAll wciecie">156 kk</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">157 kk</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">udział w bójce lub pobiciu art.</td>
                    <td class="borderAll wciecie">158 kk</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">159 kk</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">przestępstwa z ustawy o przeciwdziałaniu narkomani </td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">zgwałcenie art. 197 kk </td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="7">korupcja art. </td>
                    <td class="col_100 borderAll ">228 kk </td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">229 kk </td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">230 kk </td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">231 kk </td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">250a kk </td>
                    <td class="borderAll col_36">13</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">296a kk </td>
                    <td class="borderAll col_36">14</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">296b kk </td>
                    <td class="borderAll col_36">15</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">kradzież rzeczy art. 278 kk </td>
                    <td class="borderAll col_36">16</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym kradzież samochodu </td>
                    <td class="borderAll col_36">17</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">kradzież z włamaniem art. 279 kk </td>
                    <td class="borderAll col_36">18</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">rozbój art. 280 kk </td>
                    <td class="borderAll col_36">19</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">kradzież rozbójnicza art. 281 kk </td>
                    <td class="borderAll col_36">20</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">wymuszenie rozbójnicze 282 kk </td>
                    <td class="borderAll col_36">21</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">oszustwo art. </td>
                    <td class="col_100 borderAll ">286 kk </td>
                    <td class="borderAll col_36">22</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll ">287 kk </td>
                    <td class="borderAll col_36">23</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">prowadzenie pojazdu na drodze przez osobę w stanie nietrzeźwym lub pod wpływem środka odurzającego art. 178a kk </td>
                    <td class="borderAll col_36">24</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.b!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112b_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <br />

        <strong>Dział 1.1.2.c </strong>&nbsp;Załatwiono w odniesieniu do osób (z wyłączeniem orzeczeń zmienionych w czasie wykonywania orzeczeń) Rep. Nkd<div id='1.1.2.c'>
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" colspan="3">Wyszczególnienia</td>
                    <td class="col_110 center borderAll ">ogółem</td>
                    <td class="col_110 center borderAll ">Demoralizacja</td>
                    <td class="col_110 center borderAll ">Czyny karalne</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="3">0</td>
                    <td class="col_110 center borderAll ">1</td>
                    <td class="col_110 center borderAll ">2</td>
                    <td class="col_110 center borderAll ">3</td>
                </tr>
                <tr>
                    <td colspan="2" class="borderAll wciecie">Załatwiono ogółem (w. 2 do 5+10+23+32+33+37) </td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td colspan="2" class="borderAll wciecie">Nie wszczęto postępowania </td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="2">Umorzono z powodu </td>
                    <td class="borderAll wciecie">niecelowości ze wzgl. na orzeczone środki w innej sprawie </td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">innego </td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="5">Przekazano </td>
                    <td class="borderAll wciecie">ogółem (w. 6–9) </td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">innemu sądowi </td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">prokuratorowi </td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">szkole i organizacji </td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">innemu organowi </td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Orzeczono środki wychowawcze wobec osób </td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Środki wychowawcze – ogółem a) (art. 6 ustawy) *) (w. 12 do 22) </td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Upomnienie (pkt. 1) </td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Zobowiązanie do określonego postępowania (pkt. 2) </td>
                    <td class="borderAll col_36">13</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Nadzór odpowiedzialny rodziców lub opiekuna (p. 3) </td>
                    <td class="borderAll col_36">14</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Nadzór organizacji, zakładu pracy, osoby godnej zaufania (p.4) </td>
                    <td class="borderAll col_36">15</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Nadzór kuratora (p. 5) </td>
                    <td class="borderAll col_36">16</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Skierowanie do ośrodka kuratorskiego (p. 6) </td>
                    <td class="borderAll col_36">17</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Zakaz prowadzenia pojazdów (p. 7) </td>
                    <td class="borderAll col_36">18</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Przepadek rzeczy (p.8) </td>
                    <td class="borderAll col_36">19</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="2">Art. 6 pkt 9 umieszczono w</td>
                    <td class="borderAll wciecie">rodzinie zastępczej zawodowej (p. 9) </td>
                    <td class="borderAll col_36">20</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
                    <td class="borderAll col_36">21</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll" colspan="2">Inny środek wychowawczy (pkt. 11) </td>
                    <td class="borderAll col_36">22</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Orzeczono środki poprawcze ogółem (w. 24 do 25)</td>

                    <td class="borderAll col_36">23</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w23_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Zakład poprawczy bez zawieszenia </td>
                    <td class="borderAll col_36">24</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w24_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Zakład poprawczy z zawieszeniem </td>
                    <td class="borderAll col_36">25</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w25_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w25_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w25_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="6">Środki w okresie zawieszenia zakładu poprawczego b) </td>
                    <td class="borderAll wciecie">nadzór kuratora </td>
                    <td class="borderAll col_36">26</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w26_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w26_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w26_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">skierowanie do kuratorskiego ośrodka </td>
                    <td class="borderAll col_36">27</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w27_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w27_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w27_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">umieszczenie w rodzinie zastęp. </td>
                    <td class="borderAll col_36">28</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w28_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w28_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w28_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">nadzór organizacji, zakładu pracy, osoby godnej zaufania </td>
                    <td class="borderAll col_36">29</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w29_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w29_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w29_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">umieszczenie w młodzieżowym ośrodku wychowawczym </td>
                    <td class="borderAll col_36">30</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w30_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w30_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w30_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">inne środki </td>
                    <td class="borderAll col_36">31</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w31_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w31_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w31_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Orzeczono karę </td>
                    <td class="borderAll col_36">32</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w32_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w32_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w32_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Środki leczniczo-wychowawcze (art. 26*)) </td>
                    <td class="borderAll col_36">33</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w33_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w33_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w33_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_100 borderAll " rowspan="3">w tym umieszczenie w </td>
                    <td class="borderAll wciecie">zakładzie leczniczym </td>
                    <td class="borderAll col_36">34</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w34_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w34_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w34_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
                    <td class="borderAll col_36">35</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w35_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w35_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w35_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">domu pomocy społecznej </td>
                    <td class="borderAll col_36">36</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w36_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w36_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w36_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Załatwiono w inny sposób</td>
                    <td class="borderAll col_36">37</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!1!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w37_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!2!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w37_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!3!4')">
                        <asp:Label CssClass="normal" ID="tab_112c_w37_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        *) Ustawa z dnia 26 października 1982 r. o postępowaniu w sprawach nieletnich (Dz. U. z 2016 r., poz. 1654)
          <br />
        a) Liczba środków nie może być mniejsza od liczby orzeczeń wykazanej w wierszu 2.
          <br />
        b) Wykazuje się wszystkie środki orzeczone przy zawieszeniu zakładu poprawczego. Suma wierszy 26 do 31 może być zatem większa od liczby w wierszu 25.
          <br />
        <br />

        <div id='Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)' class="page-break">
            <br />
            <strong>Dział 1.1.3 Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)</strong>
            <table style="width: 100%;">
                <tr>
                    <td class="center borderAll" colspan="3">Wyszczególnienie</td>
                    <td class="center borderAll">Liczba</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="3">0</td>
                    <td class="center borderAll">1</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Umieszczenie w schronisku dla nieletnich</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">&nbsp;Nadzór kuratora</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">umieszczenie  w</td>
                    <td class="borderAll wciecie">zakładzie leczniczym</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">młodzieżowym ośrodku wychowawczym</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">domu pomocy społecznej</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_113_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <br />
        <br />
        <div id='1.1.4'>
            <strong>Dział 1.1.4</strong> Obciążenie kosztami postępowania we wszystkich sprawach  Nw, Nkd – łącznie (art. 32  ustawy)*)
   <table style="width: 100%;">
       <tr>
           <td class="center borderAll" colspan="2">Wyszczególnienie </td>
           <td class="center borderAll">Liczba</td>
       </tr>
       <tr>
           <td class="center borderAll" colspan="2">0</td>
           <td class="center borderAll">1</td>
       </tr>
       <tr>
           <td class="borderAll wciecie">Rodziców </td>
           <td class="borderAll col_36">1</td>
           <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.4!1!4')">
               <asp:Label CssClass="normal" ID="tab_1_1_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">Nieletnich</td>
           <td class="borderAll col_36">2</td>
           <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.4!1!4')">
               <asp:Label CssClass="normal" ID="tab_1_1_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">Innych osób zobowiązanych do alimentacji</td>
           <td class="borderAll col_36">3</td>
           <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.4!1!4')">
               <asp:Label CssClass="normal" ID="tab_1_1_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
       </tr>
   </table>
        </div>
        <div id='1.1.5' class="page-break">

            <strong>
                <br />
                <strong>Dział 1.1.5</strong> Środki zobowiązujące rodziców (opiekunów)   (art. 7  ustawy)*)</strong>
            <table style="width: 100%;">
                <tr>
                    <td class="center borderAll" colspan="3">Wyszczególnienie</td>
                    <td class="center borderAll">Liczba</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="3">0</td>
                    <td class="center borderAll">1</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">Zobowiązano rodziców (opiekuna) do</td>
                    <td class="borderAll wciecie">Poprawy określonych warunków nieletniego</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!1!4')">
                        <asp:Label CssClass="normal" ID="tab_115_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">naprawienia szkody wyrządzonej przez nieletniego</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.5!1!4')">
                        <asp:Label CssClass="normal" ID="tab_115_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">inne</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.5!1!4')">
                        <asp:Label CssClass="normal" ID="tab_115_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <br />
        <div id="1.1.6">
            <strong>Dział 1.1.6</strong> Nieletni oczekujący na umieszczenie i umieszczeni
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                     <td class="center borderAll">Liczba</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="4">0</td>
                     <td class="center borderAll">1</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="3">Liczba nieletnich umieszczonych w zakładach poprawczych (stan w ostatnim dniu okresu sprawozdawczego) (wydane skierowania)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="8">Liczba nieletnich
                          <br />
                         oczekujących na umieszczenie
                          <br />
                         (stan w ostatnim dniu
                          <br />
                         okresu sprawozdawczego)</td>
                     <td class="borderAll wciecie" colspan="2">w zakładzie poprawczym</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="2">w tym oczekujący</td>
                     <td class="borderAll wciecie">w schronisku</td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">na wolności</td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w instytucji lub organizacji w celu przygotowania do zawodu</td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w rodzinie zastępczej</td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w zakładzie leczniczym</td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w młodzieżowym ośrodku wychowawczym</td>
                     <td class="borderAll col_36">8</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w domu pomocy społecznej</td>
                     <td class="borderAll col_36">9</td>
                     <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.6!1!4')">
                         <asp:Label ID="tab_1_1_6_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>

        <br />

        <div id='Kartoteka „a”' class="page-break">
            <br />
            <strong>Dział 1.1.7.a.&nbsp; </strong>
            Kartoteka „a”
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="2" rowspan="4">Wykonywane środki</td>
            <td class="center borderAll" rowspan="4">Stan w ostatnim dniu poprzedniego okresu sprawoz-dawczego</td>
            <td class="center borderAll" rowspan="4">Przybyło</td>
            <td class="center borderAll" colspan="10">U B Y Ł O&nbsp; Z&nbsp; P O W O D U</td>
            <td class="center borderAll" rowspan="4">Stan w ostatnim dniu okresu sprawoz-dawczego</td>
            <td class="center borderAll" rowspan="4">Wykonywane środki</td>
        </tr>
        <tr>
            <td class="center borderAll" rowspan="3">ogółem (rubr. 4 do 12)</td>
            <td class="center borderAll" rowspan="3">uchylenia środka</td>
            <td class="center borderAll" rowspan="3">upływu wieku</td>
            <td class="center borderAll" colspan="2">odwołania warunkowego </td>
            <td class="center borderAll" colspan="2">orzeczenia</td>
            <td class="center borderAll" rowspan="3">zmiany rodzaju środka</td>
            <td class="center borderAll" rowspan="3">przekazania innemu sądowi</td>
            <td class="center borderAll" rowspan="3">innego</td>
        </tr>
        <tr>
            <td class="center borderAll">zawieszenia </td>
            <td class="center borderAll">zwolnienia z</td>
            <td class="center borderAll" rowspan="2">zakładu popraw-czego</td>
            <td class="center borderAll" rowspan="2">kary</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="2">zakładu poprawczego </td>
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
        </tr>
        <tr>
            <td class="borderAll wciecie">Zobowiązanie do określonego postępowania</td>
            <td class="borderAll col_36">1</td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!2!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!3!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!4!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!5!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!6!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!7!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!8!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!9!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!10!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!11!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!12!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!13!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c13" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!14!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w01_c14" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Nadzór odpowiedzialny rodziców lub opiekunów</td>
            <td class="borderAll col_36">2</td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!2!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!3!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!4!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!5!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!6!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!7!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!8!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!9!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!10!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!11!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!12!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!13!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c13" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!14!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w02_c14" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Nadzór organizacji, zakładu pracy, osoby godnej zaufania</td>
            <td class="borderAll col_36">3</td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!2!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!3!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!4!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!5!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!6!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!7!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!8!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!9!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!10!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!11!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!12!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!13!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c13" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!14!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w03_c14" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Nadzór kuratora</td>
            <td class="borderAll col_36">4</td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!2!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!3!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!4!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!5!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!6!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!7!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!8!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!9!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!10!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!11!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!12!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!13!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c13" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!14!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w04_c14" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Skierowanie do ośrodka kuratorskiego </td>
            <td class="borderAll col_36">5</td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!2!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!3!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!4!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!5!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!6!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!7!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!8!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!9!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!10!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!11!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!12!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!13!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c13" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_81 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!14!4')">
                <asp:Label CssClass="normal" ID="tab_117a_w05_c14" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>
        <div id="1.1.7.b">
            <strong>
                <br />
                Dział 1.1.7.b</strong> Kartoteka „b”
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="2" rowspan="2">Wykonywane środki – umieszczenie w </td>
                     <td class="center borderAll" rowspan="2">Stan w ostatnim dniu poprze-dniego okresu sprawoz-dawczego </td>
                     <td class="center borderAll" rowspan="2">Przybyło</td>
                     <td class="center borderAll" colspan="8">U B Y Ł O&nbsp;&nbsp; Z&nbsp;&nbsp;&nbsp; P O W O D U</td>
                     <td class="center borderAll" rowspan="2">Stan w ostatnim dniu okresu sprawoz-dawczego</td>
                     <td class="center borderAll" rowspan="2">Wykony-wane środki</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">ogółem</td>
                     <td class="center borderAll">warun-kowego zwolnienia</td>
                     <td class="center borderAll">zmiany lub uchylenia środka</td>
                     <td class="center borderAll">zwolnienia z powodu upływu wieku</td>
                     <td class="center borderAll">umieszczenia w zakładzie poprawczym</td>
                     <td class="center borderAll">orzeczenia kary</td>
                     <td class="center borderAll">orzeczenia kary przekazania innemu sądowi</td>
                     <td class="center borderAll">innego</td>
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
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">instytucji lub organizacji do przygotowania zawodowego</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">rodzinie zastępczej</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">młodzieżowym ośrodku wychowawczym</td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">młodzieżowym ośrodku socjoterapii</td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">zakładzie poprawczym</td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">zakładzie leczniczym lub innym odpowiednim zakładzie</td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!1!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!2!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!3!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!4!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!5!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!6!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!7!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!8!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!9!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!10!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!11!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!12!4')">
                         <asp:Label ID="tab_1_1_7_b_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <br />
        <div id='1.1.7.c' class="page-break">
            <br />
            <strong>Dział 1.1.7.c</strong>  Liczba spraw Nw
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="2">Wyszczególnienie</td>
            <td class="borderAll center ">Liczba spraw ogółem *)</td>
            <td class="borderAll center ">Stan w ostatnim dniu poprzedniego okresu sprawozdawczego</td>
            <td class="borderAll center ">Przybyło</td>
            <td class="borderAll center ">Ubyło</td>
            <td class="borderAll center ">Stan w ostatnim dniu okresu sprawozdawczego</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="2">0</td>
            <td class="borderAll center ">1</td>
            <td class="borderAll center ">2</td>
            <td class="borderAll center ">3</td>
            <td class="borderAll center ">4</td>
            <td class="borderAll center ">5</td>
        </tr>
        <tr>
            <td class="borderAll col_150">Sprawy Nw</td>
            <td class="borderAll col_36">1</td>
            <td class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!1!4')">
                <asp:Label CssClass="normal" ID="tab_117c_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!2!4')">
                <asp:Label CssClass="normal" ID="tab_117c_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!3!4')">
                <asp:Label CssClass="normal" ID="tab_117c_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!4!4')">
                <asp:Label CssClass="normal" ID="tab_117c_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!5!4')">
                <asp:Label CssClass="normal" ID="tab_117c_w01_c05" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
            *) Liczba postępowań wykonawczych prowadzonych w stosunku do danego nieletniego – pozostających w toku
        </div>
        <br />
        <div id="1.1.8" class="page-break">
            <strong>Dział 1.1.8</strong> Ośrodki kuratorskie
              <table style="width: 100%">
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie</td>
                      <td class="borderAll col_150 center">Liczba</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="borderAll col_150 center">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">Ośrodki</td>
                      <td class="borderAll wciecie" colspan="2">stan w ostatnim dniu poprzedniego okresu sprawozdawczego </td>
                      <td class="borderAll col_36">1</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w okresie sprawozdawczym</td>
                      <td class="borderAll wciecie">przybyło</td>
                      <td class="borderAll col_36">2</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">ubyło</td>
                      <td class="borderAll col_36">3</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">stan w ostatnim dniu okresu sprawozdawczego</td>
                      <td class="borderAll col_36">4</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">Nieletni</td>
                      <td class="borderAll wciecie" colspan="2">ogółem (stan w ostatnim dniu okresu sprawozdawczego)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym ze spraw Nw</td>
                      <td class="borderAll col_36">6</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />

        <div id="1.1.9" class="page-break">
            <strong>Dział 1.1.9</strong> Posiedzenia wykonawcze
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie</td>
                     <td class="center borderAll" colspan="5">Liczba spraw, w których</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">Ogółem (rubr. 2 do 5) </td>
                     <td class="center borderAll">wydano orzeczenie wykonawcze (merytoryczne)</td>
                     <td class="center borderAll">wykonano czynności kontrolne</td>
                     <td class="center borderAll">podjęto czynności lub działania pozaorzecznicze poza sądem</td>
                     <td class="center borderAll">inne</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="2">0</td>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                     <td class="center borderAll">3</td>
                     <td class="center borderAll">4</td>
                     <td class="center borderAll">5</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Sprawy załatwione na posiedzeniach wykonawczych (w. 2 do 4)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!1!4')">
                         <asp:Label ID="tab_1_1_9_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!2!4')">
                         <asp:Label ID="tab_1_1_9_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!3!4')">
                         <asp:Label ID="tab_1_1_9_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!4!4')">
                         <asp:Label ID="tab_1_1_9_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!5!4')">
                         <asp:Label ID="tab_1_1_9_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">nieletnich</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!1!4')">
                         <asp:Label ID="tab_1_1_9_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!2!4')">
                         <asp:Label ID="tab_1_1_9_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!3!4')">
                         <asp:Label ID="tab_1_1_9_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!4!4')">
                         <asp:Label ID="tab_1_1_9_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!5!4')">
                         <asp:Label ID="tab_1_1_9_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">małoletnich</td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!1!4')">
                         <asp:Label ID="tab_1_1_9_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!2!4')">
                         <asp:Label ID="tab_1_1_9_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!3!4')">
                         <asp:Label ID="tab_1_1_9_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!4!4')">
                         <asp:Label ID="tab_1_1_9_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!5!4')">
                         <asp:Label ID="tab_1_1_9_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">dorosłych</td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!1!4')">
                         <asp:Label ID="tab_1_1_9_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!2!4')">
                         <asp:Label ID="tab_1_1_9_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!3!4')">
                         <asp:Label ID="tab_1_1_9_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!4!4')">
                         <asp:Label ID="tab_1_1_9_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!5!4')">
                         <asp:Label ID="tab_1_1_9_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Liczba posiedzeń</td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!1!4')">
                         <asp:Label ID="tab_1_1_9_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!2!4')">
                         <asp:Label ID="tab_1_1_9_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!3!4')">
                         <asp:Label ID="tab_1_1_9_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!4!4')">
                         <asp:Label ID="tab_1_1_9_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!5!4')">
                         <asp:Label ID="tab_1_1_9_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <div id='Ustanowienie pełnomocnika / obrońcy z urzędu' class="page-break">
            <br />
            <strong>Dział 1.1.10 </strong>
            Ustanowienie pełnomocnika / obrońcy z urzędu
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="2">Repertorium lub wykaz</td>
            <td class="center borderAll">Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat)</td>
            <td class="center borderAll">Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat) </td>
            <td class="center borderAll">W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika </td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="2">0</td>
            <td class="center borderAll">1</td>
            <td class="center borderAll">2</td>
            <td class="center borderAll">3</td>
        </tr>
        <tr>
            <td class="borderAll  col_60 wciecie">RC</td>
            <td class="borderAll col_36">1</td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!1!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!2!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!3!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w01_c03" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll  col_60 wciecie">RNc</td>
            <td class="borderAll col_36">2</td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!1!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!2!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!3!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w02_c03" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll  col_60 wciecie">Nsm</td>
            <td class="borderAll col_36">3</td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!1!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!2!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!3!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w03_c03" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll  col_60 wciecie">Nkd</td>
            <td class="borderAll col_36">4</td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!1!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!2!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!3!4')">
                <asp:Label CssClass="normal" ID="tab_1110_w04_c03" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <br />
        <h4><span lang="PL">Sprawy z zakresu spraw cywilnych rodzinnych i nieletnich – część wspólna<o:p></o:p></span></h4>
        <br />

        &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>

        <br />
        <strong>Dział 4.</strong> Zezwolenie na wyjazd dzieci za granicę (nie dotyczy przysposobień przez osoby zamieszkałe za granicą) (należy podać liczbę dzieci w ciągu okresu sprawozdawczego):
        <br />
        <table style="width: 100%;">
            <tr>
                <td class="col_36">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="col_36">&nbsp;</td>
                <td>Wpłynęło wniosków </td>
                <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4!1!4')">
                    <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_36">&nbsp;</td>
                <td>Zezwolono na wyjazd </td>
                <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4!1!4')">
                    <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
        <br />
        <br />
        <div id="5" class="page-break">
            <strong>Dział 5</strong> Prawomocne orzeczenia w sprawach o alimenty poza alimentami orzeczonymi w trakcie rozwodu (sprawy)
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="3" rowspan="3">RODZAJE SPRAW O ALIMENTY </td>
                     <td class="center borderAll" rowspan="3">Ogółem (kol. 2 do 5) </td>
                     <td class="center borderAll" colspan="4">Liczba spraw, w których powództwo</td>
                     <td class="center borderAll" rowspan="3">Wysokość zasądzonych alimentów (ogólna kwota w złotych) </td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="2">uwzględniono w całości, w części i ponad żądanie zawarto ugodę </td>
                     <td class="center borderAll" colspan="2">zawarto ugodę</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">o zasądzenie pierwszy raz</td>
                     <td class="center borderAll">o zmianę wy-sokości</td>
                     <td class="center borderAll">o zasądzenie pierwszy raz</td>
                     <td class="center borderAll">o zmianę wy-sokości</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="3">0</td>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                     <td class="center borderAll">3</td>
                     <td class="center borderAll">4</td>
                     <td class="center borderAll">5</td>
                     <td class="center borderAll">6</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Razem (wiersz 2 do 7)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!1!4')">
                         <asp:Label ID="tab_5_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!2!4')">
                         <asp:Label ID="tab_5_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!3!4')">
                         <asp:Label ID="tab_5_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!4!4')">
                         <asp:Label ID="tab_5_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!5!4')">
                         <asp:Label ID="tab_5_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!6!4')">
                         <asp:Label ID="tab_5_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="6">z powodu</td>
                     <td class="borderAll wciecie">dzieci (w tym małoletnich) </td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!1!4')">
                         <asp:Label ID="tab_5_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!2!4')">
                         <asp:Label ID="tab_5_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!3!4')">
                         <asp:Label ID="tab_5_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!4!4')">
                         <asp:Label ID="tab_5_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!5!4')">
                         <asp:Label ID="tab_5_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!6!4')">
                         <asp:Label ID="tab_5_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">rodziców </td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!1!4')">
                         <asp:Label ID="tab_5_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!2!4')">
                         <asp:Label ID="tab_5_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!3!4')">
                         <asp:Label ID="tab_5_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!4!4')">
                         <asp:Label ID="tab_5_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!5!4')">
                         <asp:Label ID="tab_5_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!6!4')">
                         <asp:Label ID="tab_5_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">małżonków </td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!1!4')">
                         <asp:Label ID="tab_5_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!2!4')">
                         <asp:Label ID="tab_5_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!3!4')">
                         <asp:Label ID="tab_5_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!4!4')">
                         <asp:Label ID="tab_5_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!5!4')">
                         <asp:Label ID="tab_5_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!6!4')">
                         <asp:Label ID="tab_5_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">małżonków i ich dzieci </td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!1!4')">
                         <asp:Label ID="tab_5_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!2!4')">
                         <asp:Label ID="tab_5_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!3!4')">
                         <asp:Label ID="tab_5_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!4!4')">
                         <asp:Label ID="tab_5_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!5!4')">
                         <asp:Label ID="tab_5_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!6!4')">
                         <asp:Label ID="tab_5_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">o ustalenie ojcostwa </td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!1!4')">
                         <asp:Label ID="tab_5_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!2!4')">
                         <asp:Label ID="tab_5_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!3!4')">
                         <asp:Label ID="tab_5_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!4!4')">
                         <asp:Label ID="tab_5_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!5!4')">
                         <asp:Label ID="tab_5_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!6!4')">
                         <asp:Label ID="tab_5_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">innych osób </td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!1!4')">
                         <asp:Label ID="tab_5_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!2!4')">
                         <asp:Label ID="tab_5_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!3!4')">
                         <asp:Label ID="tab_5_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!4!4')">
                         <asp:Label ID="tab_5_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!5!4')">
                         <asp:Label ID="tab_5_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!6!4')">
                         <asp:Label ID="tab_5_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <div id="6.1.a" class="page-break">
            <strong>Dział 6.1.a</strong> Wyszczególnienie warunków ugody w sprawach rodzinnych z wyłączeniem nieletnich
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="5">Sądowe</td>
                     <td class="center borderAll">Liczba</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="5">0</td>
                     <td class="center borderAll">1</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="5">wpływ</td>
                     <td class="borderAll wciecie" rowspan="5">Liczba</td>
                     <td class="borderAll wciecie" rowspan="3">spraw w których</td>
                     <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 8 § 1 kpc) </td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja) </td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 13 § 2 kpc) </td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="8">Rozstrzy-gnięcie<br />
                         &nbsp;przed</td>
                     <td class="borderAll wciecie" rowspan="3">Mediatorem</td>
                     <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 <sup>8</sup> § 1 kpc) - liczba </td>
                     <td class="borderAll wciecie">ugód zawartych przed mediatorem </td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                     <td class="borderAll col_36">8</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="5">sądem</td>
                     <td class="borderAll wciecie" colspan="2">Zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania) </td>
                     <td class="borderAll col_36">9</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                     <td class="borderAll col_36">10</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc) </td>
                     <td class="borderAll col_36">11</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                     <td class="borderAll col_36">12</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14 </sup>§ 3 kpc) </td>
                     <td class="borderAll col_36">13</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6.1.a!1!4')">
                         <asp:Label ID="tab_6_1_a_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="5">Pozasądowe</td>
                     <td class="borderAll center">Liczba</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="4">Liczba wniosków o zatwierdzenie ugody złożonych przez stronę </td>
                     <td class="borderAll col_36">14</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6.1.a!1!4')">
                         <asp:Label CssClass="normal" ID="tab_6_1_a_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="4">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 13 § 1 kpc) </td>
                     <td class="borderAll col_36">15</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6.1.a!1!4')">
                         <asp:Label CssClass="normal" ID="tab_6_1_a_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="4">Zatwierdzono ugodę </td>
                     <td class="borderAll col_36">16</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6.1.a!1!4')">
                         <asp:Label CssClass="normal" ID="tab_6_1_a_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="4">w tym przez nadanie klauzuli wykonalności (art. 183 14 § 2 kpc) </td>
                     <td class="borderAll col_36">17</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6.1.a!1!4')">
                         <asp:Label CssClass="normal" ID="tab_6_1_a_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="4">Odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc)</td>
                     <td class="borderAll col_36">18</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6.1.a!1!4')">
                         <asp:Label CssClass="normal" ID="tab_6_1_a_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
             </table>
        </div>
        <br />
        <br />
        <div id="6.1.b" class="page-break">
            <strong>Dział 6.1.b</strong> Wyszczególnienie warunków ugody w sprawach rodzinnych z wyłączeniem nieletnich
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="3" rowspan="2">Zakres ugody</td>
                     <td class="center borderAll" colspan="2">Z mediacji</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">sądowej </td>
                     <td class="center borderAll">pozasądowej</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="3">0</td>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">OGÓŁEM (wiersze 02 do 06+09)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Ustalono wysokość alimentów </td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Ustalono kontakty z dzieckiem </td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Ustalono miejsce zamieszkania małoletniego </td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Sposób wykonywania władzy rodzicielskiej (art. 97 § 2, art. 106, art. 107 kro) </td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">Sprawy w trybie Konwencji haskiej z 1980 r. dot. uprowadzenia (w. 07+w. 08) </td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" rowspan="2">z tego</td>
                     <td class="borderAll wciecie">o powrót dziecka</td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">o wykonywanie kontaktów</td>
                     <td class="borderAll col_36">8</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">inne</td>
                     <td class="borderAll col_36">9</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.b!1!4')">
                         <asp:Label ID="tab_6_1_b_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.b!2!4')">
                         <asp:Label ID="tab_6_1_b_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <div id="6.2" class="page-break">
            <strong>Dział 6.2</strong> 2 Ewidencja i wyniki postępowania mediacyjnego w sprawach nieletnich (proszę podać liczbę spraw, w których postępowanie zakończyło się ugodą lub w inny sposób)
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" colspan="2">Wyszczególnienie </td>
                     <td class="center borderAll">Razem</td>
                     <td class="center borderAll">Ugoda </td>
                     <td class="center borderAll">Brak ugody</td>
                     <td class="center borderAll">Inny sposób</td>
                     <td class="center borderAll">Liczba</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" colspan="2">0</td>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                     <td class="center borderAll">3</td>
                     <td class="center borderAll">4</td>
                     <td class="center borderAll">5</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">OGÓŁEM (wiersze 02 do 03)</td>
                     <td class="borderAll col_36">1</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!2!4')">
                         <asp:Label ID="tab_6_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!3!4')">
                         <asp:Label ID="tab_6_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!4!4')">
                         <asp:Label ID="tab_6_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!5!4')">
                         <asp:Label ID="tab_6_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Prowadzonego przez instytucje</td>
                     <td class="borderAll col_36">2</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!2!4')">
                         <asp:Label ID="tab_6_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!3!4')">
                         <asp:Label ID="tab_6_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!4!4')">
                         <asp:Label ID="tab_6_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!5!4')">
                         <asp:Label ID="tab_6_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Prowadzonego przez osoby uprawnione</td>
                     <td class="borderAll col_36">3</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!2!4')">
                         <asp:Label ID="tab_6_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!3!4')">
                         <asp:Label ID="tab_6_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!4!4')">
                         <asp:Label ID="tab_6_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!5!4')">
                         <asp:Label ID="tab_6_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Liczba mediacji wpisanych w okresie statystycznym do Wykazu Med</td>
                     <td class="borderAll col_36">4</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!2!4')">
                         <asp:Label ID="tab_6_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!3!4')">
                         <asp:Label ID="tab_6_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!4!4')">
                         <asp:Label ID="tab_6_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!5!4')">
                         <asp:Label ID="tab_6_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Liczba zakończonych postępowań mediacyjnych (zakreślonych pozycji w wykazie mediacji bez względu na przyczynę zakreślenia)</td>
                     <td class="borderAll col_36">5</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!2!4')">
                         <asp:Label ID="tab_6_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!3!4')">
                         <asp:Label ID="tab_6_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!4!4')">
                         <asp:Label ID="tab_6_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!5!4')">
                         <asp:Label ID="tab_6_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie" colspan="2">warunki ugody</td>
                     <td class="borderAll center" colspan="5">Liczby rodzajów form</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Zadośćuczynienie lub odszkodowanie (finansowe)dla pokrzywdzonego </td>
                     <td class="borderAll col_36">6</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td colspan="4" rowspan="6">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Świadczenie pieniężne na cele społeczne </td>
                     <td class="borderAll col_36">7</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Przeproszenie pokrzywdzonego </td>
                     <td class="borderAll col_36">8</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Wykonanie pracy na rzecz pokrzywdzonego </td>
                     <td class="borderAll col_36">9</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Wykonanie pracy na cele społeczne </td>
                     <td class="borderAll col_36">10</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Inne </td>
                     <td class="borderAll col_36">11</td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6.2!1!4')">
                         <asp:Label ID="tab_6_2_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <div id="7" class="page-break">
            <strong>Dział 7</strong> Stan wykazu Opm (stan w ostatnim dniu okresu sprawozdawczego)
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" rowspan="3">Ogółem</td>
                     <td class="center borderAll" colspan="4" rowspan="2">Liczba małoletnich pod opieką</td>
                     <td class="center borderAll" rowspan="3">Liczba małoletnich, których rodzicom ograniczono władzę rodzicielską </td>
                     <td class="center borderAll" rowspan="3">W tym (rubr. 6) przez stałą kontrolę kuratora sądowego </td>
                     <td class="center borderAll" rowspan="3">Liczba małoletnich matek</td>
                     <td class="center borderAll" colspan="2">Liczba małoletnich </td>
                 </tr>
                 <tr>
                     <td class="center borderAll">wobec których zarządzono umieszczenie</td>
                     <td class="center borderAll">którzy oczekują na umieszczenie</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">ogółem
                         <br />
                         (rubr. 3 do 5)</td>
                     <td class="center borderAll">których rodziców pozbawiono władzy rodzicielskiej</td>
                     <td class="center borderAll">których rodzicom zawieszono władzę rodzicielską</td>
                     <td class="center borderAll">sieroty naturalne</td>
                     <td class="center borderAll" colspan="2">w rodzinie zastępczej</td>
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
                 </tr>
                 <tr>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!4')">
                         <asp:Label ID="tab_7_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!4')">
                         <asp:Label ID="tab_7_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!4')">
                         <asp:Label ID="tab_7_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!4')">
                         <asp:Label ID="tab_7_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!4')">
                         <asp:Label ID="tab_7_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!4')">
                         <asp:Label ID="tab_7_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!4')">
                         <asp:Label ID="tab_7_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!8!4')">
                         <asp:Label ID="tab_7_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!9!4')">
                         <asp:Label ID="tab_7_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!10!4')">
                         <asp:Label ID="tab_7_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <br />
        <div id="8" class="page-break">
            <strong>Dział 8</strong> Wykonywane orzeczenia sądu o umieszczeniu małoletnich w placówkach opiekuńczo-wychowawczych (liczba małoletnich)
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" rowspan="2">Liczba orzeczeń wykonywanych wg stanu w ostatnim dniu poprzedniego okresu sprawozdawczego</td>
                     <td class="center borderAll" colspan="2">PRZTBYŁO</td>
                     <td class="center borderAll" colspan="6">UBYŁO Z POWODU</td>
                     <td class="center borderAll" rowspan="2">Stan w ostatnim dniu okresu sprawozdawczego (orzeczenia do wykon.) (przebywający + oczekujący) (rubr. 1+2+3) – – (rubr. 4 do 9) </td>
                     <td class="center borderAll" rowspan="2">W tym ocze- kujących na umieszczenie (orzeczenia dotychczas niewykonane) </td>
                     <td class="center borderAll" rowspan="2">W tym powyżej 3 miesięcy </td>
                 </tr>
                 <tr>
                     <td class="center borderAll">wydano orzeczeń</td>
                     <td class="center borderAll">z innych sądów</td>
                     <td class="center borderAll">powrotu do zresocjalizo-wanego środowiska rodzinnego</td>
                     <td class="center borderAll">przekazania do rodziny zastępczej</td>
                     <td class="center borderAll">przysposo-bienia</td>
                     <td class="center borderAll">skierowania do rodzinnego domu dziecka</td>
                     <td class="center borderAll">przesłania do innych sądów</td>
                     <td class="center borderAll">innego</td>
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
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!1!4')">
                         <asp:Label ID="tab_8_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!4')">
                         <asp:Label ID="tab_8_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!3!4')">
                         <asp:Label ID="tab_8_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!4!4')">
                         <asp:Label ID="tab_8_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!5!4')">
                         <asp:Label ID="tab_8_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!6!4')">
                         <asp:Label ID="tab_8_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!7!4')">
                         <asp:Label ID="tab_8_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!8!4')">
                         <asp:Label ID="tab_8_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!9!4')">
                         <asp:Label ID="tab_8_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!10!4')">
                         <asp:Label ID="tab_8_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!11!4')">
                         <asp:Label ID="tab_8_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!12!4')">
                         <asp:Label ID="tab_8_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        <br />
        <div id="9" class="page-break">
            <strong>Dział 9</strong> Stan wykazu „ALK” (stan w ostatnim dniu okresu sprawozdawczego)
             <table style="width: 100%;">
                 <tr>
                     <td class="center borderAll" rowspan="3"></td>
                     <td class="center borderAll" colspan="4">Liczba osób, wobec których wykonywane są orzeczenia o obowiązku poddania się leczeniu </td>
                     <td class="center borderAll" rowspan="3">Liczba osób oczekujących na umieszczenie w zakładzie stacjonarnym</td>
                 </tr>
                 <tr>
                     <td class="center borderAll" rowspan="2">w zakładzie niestacjonarnym</td>
                     <td class="center borderAll" rowspan="2">w zakładzie stacjonarnym </td>
                     <td class="center borderAll" colspan="2">wobec których orzeczono nadzór kuratora*) i jest wykonywany przez kuratora</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">Zawodowego </td>
                     <td class="center borderAll">społecznego</td>
                 </tr>
                 <tr>
                     <td class="center borderAll">1</td>
                     <td class="center borderAll">2</td>
                     <td class="center borderAll">3</td>
                     <td class="center borderAll">4</td>
                     <td class="center borderAll">5</td>
                     <td class="center borderAll">6</td>
                 </tr>
                 <tr>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!1!4')">
                         <asp:Label ID="tab_9_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!2!4')">
                         <asp:Label ID="tab_9_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!3!4')">
                         <asp:Label ID="tab_9_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!4!4')">
                         <asp:Label ID="tab_9_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!5!4')">
                         <asp:Label ID="tab_9_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                     <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!6!4')">
                         <asp:Label ID="tab_9_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                     </a></td>
                 </tr>
             </table>
        </div>
        *) Niezależnie od rodzaju zakładu.<br />
        <br />
        <strong>Dział 10.</strong> Liczba osób ubezwłasnowolnionych (wykaz Op) (stan w ostatnim dniu okresu sprawozdawczego)
          <br />
        <table style="width: 100%;">
            <tr>
                <td>pod opieką </td>
                <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10!1!4')">
                    <asp:Label ID="tab_10_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                </a></td>
                <td>pod kuratelą </td>
                <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10!2!4')">
                    <asp:Label ID="tab_10_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                </a></td>
            </tr>
        </table>
        <br />
        <div id="Div11_1" class="page-break">
            &nbsp;<br />
            <strong>Dział 11.1</strong>  Terminowość postępowania międzyinstancyjnego  w pierwszej instancji

     <br />
            <table style="width: 100%;">
                <tr>
                    <td class="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Środki odwoławcze, które zostały przekazane do rozpoznania sądowi II instancji</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="7">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
                </tr>
                <tr>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">Ogółem
                    (kol. 2 do 7)</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">do 2 mies.</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 2 do 3 mies.</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 3 do&nbsp; 6<br />
                        miesięcy.</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 6 do&nbsp; 12<br />
                        miesięcy.</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 12 do&nbsp;2<br />
                        lat.</td>
                    <td class="borderAll center">ponad 2 lata</td>
                </tr>
                <tr>
                    <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
                </tr>
                <tr>
                    <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Apelacje </td>
                    <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Zażalenia</td>
                    <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="mssGrayMiddle"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_111_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label2xxxds" runat="server"> <strong>Dział 11.2</strong>  Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których nastąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546)]</asp:Label>

            <table style="width: 100%;">
                <tr>
                    <td class="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Wyszczególnienie</td>
                    <td class="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="mssGrayMiddle">Wpłynęło</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Przesłano do sądu właściwego</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" colspan="3">Rozpoznanie skargi</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" rowspan="2">Kwota  (w złotych)</td>
                </tr>
                <tr>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">uwzględniono</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">oddalono</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">inne</td>
                </tr>
                <tr>
                    <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
                </tr>
                <tr>
                    <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Skargi na pracę sądu</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!4!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!5!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!6!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin; border-color: #000000 #000000 #666666 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!7!4')">
                        <asp:Label CssClass="normal" ID="tab_11_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>

        <div id='12' class="page-break">
            <strong>Dział 12</strong> Sprawy wielotomowe
   <table style="width: 100%;">
       <tr>
           <td class="center borderAll" colspan="4" rowspan="2">Sprawy z rep.</td>
           <td class="center borderAll" colspan="4">Sprawy rodzinne nieletnich wielotomowe - liczba spraw </td>
       </tr>
       <tr>
           <td class="center borderAll">zbiorczo pow. 5 tomów (kol. od 2 do 4)</td>
           <td class="center borderAll">pow. 5 do 10 tomów</td>
           <td class="center borderAll">pow. 10 do 20 tomów</td>
           <td class="center borderAll">powyżej 20 tomów</td>
       </tr>
       <tr>
           <td class="center borderAll" colspan="4">0</td>
           <td class="center borderAll">1</td>
           <td class="center borderAll">2</td>
           <td class="center borderAll">3</td>
           <td class="center borderAll">4</td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="7">RC</td>
           <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
           <td class="borderAll col_36">1</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w01_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w01_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w01_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w01_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
           <td class="borderAll col_36">2</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w02_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w02_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w02_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w02_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
           <td class="borderAll col_36">3</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w03_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w03_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w03_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w03_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
           <td class="borderAll col_36">4</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w04_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w04_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w04_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w04_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
           <td class="borderAll col_36">5</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w05_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w05_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w05_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w05_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
           <td class="borderAll col_36">6</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w06_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w06_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w06_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w06_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
           <td class="borderAll col_36">7</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w07_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w07_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w07_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w07_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="7">RNs</td>
           <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
           <td class="borderAll col_36">8</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w08_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w08_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w08_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w08_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
           <td class="borderAll col_36">9</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w09_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w09_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w09_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w09_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
           <td class="borderAll col_36">10</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w10_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w10_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w10_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w10_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
           <td class="borderAll col_36">11</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w11_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w11_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w11_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w11_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
           <td class="borderAll col_36">12</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w12_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w12_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w12_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w12_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
           <td class="borderAll col_36">13</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w13_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w13_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w13_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w13_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
           <td class="borderAll col_36">14</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w14_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w14_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w14_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w14_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="7">Nsm</td>
           <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
           <td class="borderAll col_36">15</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w15_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w15_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w15_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w15_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
           <td class="borderAll col_36">16</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w16_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w16_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w16_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w16_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
           <td class="borderAll col_36">17</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w17_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w17_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w17_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w17_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
           <td class="borderAll col_36">18</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w18_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w18_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w18_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w18_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
           <td class="borderAll col_36">19</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w19_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w19_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w19_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w19_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
           <td class="borderAll col_36">20</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w20_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w20_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w20_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w20_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
           <td class="borderAll col_36">21</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w21_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w21_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w21_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w21_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="7">Nkd</td>
           <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
           <td class="borderAll col_36">22</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w22_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w22_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w22_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w22_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
           <td class="borderAll col_36">23</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w23_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w23_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w23_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w23_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
           <td class="borderAll col_36">24</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w24_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w24_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w24_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w24_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
           <td class="borderAll col_36">25</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w25_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w25_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w25_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w25_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" rowspan="2">w tym</td>
           <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
           <td class="borderAll col_36">26</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w26_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w26_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w26_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w26_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
           <td class="borderAll col_36">27</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w27_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w27_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w27_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w27_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
       <tr>
           <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
           <td class="borderAll col_36">28</td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!1!4')">
               <asp:Label CssClass="normal" ID="tab_12_w28_c01" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!2!4')">
               <asp:Label CssClass="normal" ID="tab_12_w28_c02" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!3!4')">
               <asp:Label CssClass="normal" ID="tab_12_w28_c03" runat="server" Text="0"></asp:Label></a></td>
           <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!4!4')">
               <asp:Label CssClass="normal" ID="tab_12_w28_c04" runat="server" Text="0"></asp:Label></a></td>
       </tr>
   </table>
        </div>

        <br />
        <div id="14.3" class="page-break">
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>

            <br />

            <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

            <br />
        </div>

        <div id="15.1" class="page-break">

            <table style="width: 100%;">
                <tr>
                    <td style="width: 1000px"><strong>Dział 15.1 Liczba powołań tłumaczy </strong></td>
                    <td>
                        <a href="javascript:openPopup('popup.aspx?sesja=1!15.1!1!4')">
                            <asp:TextBox ID="tab_151_w01_c01" runat="server" ReadOnly="True" CssClass="col_155">0</asp:TextBox>
                        </a>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <div id="Div11" class="page-break">

            <strong>Dział 15.2</strong> Terminowość sporządzania tłumaczeń pisemnych
              <br />
            <table style="width: 100%;">
                <tr>
                    <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="mssGrayMiddle" colspan="8">Liczba sporządzonych tłumaczeń pisemnych</td>
                </tr>
                <tr>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140" rowspan="2">razem
                    <br />
                        (kol.1= 2 do 5 =
                    <br />
                        6 do 8)</td>
                    <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140" rowspan="2">w ustalonym terminie</td>
                    <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3">po ustalonym terminie </td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="3">wg czasu wydania opinii</td>
                </tr>
                <tr>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">do 30dni</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 1 do 3 miesięcy</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 30 dni</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 1 do 3 miesięcy</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
                </tr>
                <tr>
                    <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_140">1</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">2</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">3</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">4</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">5</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">6</td>
                    <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">7</td>
                    <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_140">8</td>
                </tr>
                <tr>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #000000;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!4!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!5!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!6!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!7!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.2!8!4')">
                        <asp:Label CssClass="normal" ID="tab_152_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
            <br />

            <br />
        </div>

        <div id="Div11" class="page-break">

            <strong>Dział 15.3</strong> Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo
              <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style2" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                    <td class="borderAll center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" colspan="8">Skierowanie rachunku do oddziału finansowego
                    <br />
                        wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                </tr>
                <tr>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">razem (kol.2-4) </td>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140">do 14 dni</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 14 do 30dni</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow.yżej miesiąca</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">razem (ko. 4-8)</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 14 dni</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 14 do 30dni</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">razem powyżej miesiąca (kol. 9-12)</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">pow. 1 do 2 miesięcy</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">pow. 2 do 3 miesięcy </td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">pow. 3 do 6 miesięcy </td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">pow. 6 miesięcy</td>
                </tr>
                <tr>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">1</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">2</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">3</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">4</td>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">5</td>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">6</td>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">7</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="auto-style10">8</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="auto-style10">9</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="auto-style10">10</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="auto-style10">11</td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="auto-style10">12</td>
                </tr>
                <tr>
                    <td class="borderAll center col_120" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px; border-color: #000000 #666666 #000000 #666666; border-width: thin 0px thin thin;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!7!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!8!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!9!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!10!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!11!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_120" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!15.3!12!4')">
                        <asp:Label CssClass="normal" ID="tab_153_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
            <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

            <br />
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
</asp:Content>