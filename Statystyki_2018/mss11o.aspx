<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss11o.aspx.cs" Inherits="Statystyki_2018.mss11o" %>

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
            font-weight: normal;
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
          <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="3" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc">&nbsp;&nbsp; Sąd Okręgowy w 
                            <br />
&nbsp;&nbsp;
                            <br />
&nbsp;&nbsp;&nbsp; ..................................<br />
                            &nbsp;<br />
                        </td>
                        <td class="borderAll col_33prc center"><strong><span class="auto-style1">MS-S11o<br />
                            </span></strong>
                            <br />
                            <span class="auto-style2">
                            <strong>SPRAWOZDANIE 
                            <br />
                            <br />
                            </strong>
                            z zakresu prawa pracy i ubezpieczeń społecznych</span><br />
                        </td>
                        <td class="borderAll col_33prc">Adresat:
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp; Ministerstwo Sprawiedliwości Departament Strategii i Funduszy Europejskich</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_15prc">&nbsp;&nbsp;&nbsp;<span class="auto-style1"> Obszar Sądu Apelacyjnego
                            <br />
&nbsp;&nbsp;&nbsp; w…………………………………………….</span></td>
                        <td class="center borderAll">
                            za … kwartał …**) 20… r.</td>
                        <td class="borderAll col_33prc">
                            <br />
                            Termin przekazania: do
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 dnia kalendarzowego po każdym kwartale z danymi narastającymi od początku roku do końca kwartału<br />
                        </td>
                    </tr>
                    </table>
                <br />

            <br />

            <asp:Label ID="kod011" runat="server"></asp:Label>
            <br />

            <div id='Terminowość sporządzania tłumaczeń pisemnych' class="page-break">
                <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>

                <br />
                <strong>Dział 10.2 Terminowość sporządzania tłumaczeń pisemnych</strong>&nbsp;
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="8">Liczba sporządzonych tłumaczeń pisemnych</td>
        </tr>
        <tr>
            <td class="center borderAll" rowspan="2">razem
     <br />
                (kol.1= 2 do 5 = 6 do 8)</td>
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
            <td class="center borderAll">pow. 3 miesięcy</td>
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
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!1!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!2!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!3!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!4!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!5!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!6!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!7!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!8!4')">
                <asp:Label CssClass="normal" ID="tab_102_w01_c08" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
            </div>

            <br />

            <div id='Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo' class="page-break">
                <br />
                <strong>Dział 10.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo</strong>&nbsp;
    <table style="width: 100%;">
        <tr>
            <td class="center borderAll" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
            <td class="center borderAll" colspan="8">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
        </tr>
        <tr>
            <td class="center borderAll">razem (kol.2-4)</td>
            <td class="center borderAll">do 14 dni</td>
            <td class="center borderAll">pow. 14 do 30 dni</td>
            <td class="center borderAll">powyżej miesiąca</td>
            <td class="center borderAll">razem (kol. 6-8)</td>
            <td class="center borderAll">do 14 dni</td>
            <td class="center borderAll">pow.14 do 30 dni</td>
            <td class="center borderAll">razem powyżej miesiąca (kol. 9-12)</td>
            <td class="center borderAll">pow. 1 do 2 miesięcy </td>
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
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!8!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!9!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!10!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!11!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!12!4')">
                <asp:Label CssClass="normal" ID="tab_103_w01_c12" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
            </div>
            <br />
            &nbsp;<div class="page-break">
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

            <table style="width: 100%;">
                <tr>
                    <td class="col_100">&nbsp;</td>
                    <td>Wyjaśnienia dotyczące sprawozdania można uzyskać pod numerem telefonu </td>
                    <td class=" col_180">.......................................................</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />
            </strong>
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
        </div>
    </div>
</asp:Content>