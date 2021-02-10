<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss40r.aspx.cs" Inherits="Statystyki_2018.mss40r" %>

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
            font-size: x-large;
        }

        .auto-style2 {
            font-size: large;
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

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; left: 0px; display: block">

        <br />
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
                    &nbsp;(Zespół Kuratorskiej Służby Sądowej)<br />
                </td>
                <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S40r<br />
                </span></strong>
                    <br />
                    <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                    <br />
                    z działalności kuratorskiej służby sądowej </td>
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
        <br />

        <div class="page-break">

            <strong>
                <br />
                Część&nbsp; I. ZADANIA WYKONYWANE W ZESPOŁACH KURATORSKIEJ SŁUZBY SĄDOWEJ WYKONUJĄCEJ ORZECZENIA W SPRAWACH KARNYCH
           <br />
                Dział 1. </strong>Ewidencja wykonywanych zadań
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " rowspan="3" align="center" colspan="3">Wyszczególnienie </td>
                    <td class="borderTopLeft col_36" rowspan="3">l.p.</td>
                    <td class="borderTopLeft " align="center" colspan="4">Stan w ostatnim dniu poprzedniego roku </td>
                    <td class="borderTopLeft " align="center" colspan="2">Wpłynęło do zespołu w okresie sprawozdawczym </td>
                    <td class="borderTopLeft " align="center" colspan="3">Zakończono postępowanie w okresie sprawozdawczym </td>
                    <td class="borderTopLeftRight" align="center" colspan="4">Stan w ostatnim dniu okresu sprawozdawczego</td>
                </tr>
                <tr>
                    <td class="borderTopLeft " rowspan="2" align="center">Spraw
                       <br />
                        (kol.2+3) </td>
                    <td class="borderTopLeft " align="center" colspan="2">wykonywanych przez: </td>
                    <td class="borderTopLeft " rowspan="2" align="center">Osób
                       <br />
                        objętych
                       <br />
                        postępo-waniem </td>
                    <td class="borderTopLeft " rowspan="2" align="center">spraw </td>
                    <td class="borderTopLeft " rowspan="2" align="center">w tym przeka-<br />
                        zanych<br />
                        &nbsp;z innych zespołów </td>
                    <td class="borderTopLeft " rowspan="2" align="center">spraw </td>
                    <td class="borderTopLeft " align="center" colspan="2">w tym w wyniku: </td>
                    <td class="borderTopLeft " rowspan="2" align="center">Spraw
                       <br />
                        (kol.2+3) </td>
                    <td class="borderTopLeft " align="center" colspan="2">wykonywanych przez: </td>
                    <td class="borderTopLeftRight col_69" rowspan="2" align="center">Osób objętych
                       <br />
                        postępo-waniem </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">kuratora
                       <br />
                        zawodo-wego </td>
                    <td class="borderTopLeft " align="center">kuratora
                       <br />
                        społecz-nego </td>
                    <td class="borderTopLeft " align="center">przekazania
                       <br />
                        do innych
                       <br />
                        zespołów </td>
                    <td class="borderTopLeft " align="center">obligato-ryjnego
                       <br />
                        orzeczenia sądu </td>
                    <td class="borderTopLeft " align="center">kuratora
                       <br />
                        zawodo-wego </td>
                    <td class="borderTopLeft " align="center">kuratora
                       <br />
                        społeczn-ego </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="4" align="center">0</td>
                    <td class="borderTopLeft col_69" align="center">1</td>
                    <td class="borderTopLeft col_69" align="center">2</td>
                    <td class="borderTopLeft col_69" align="center">3</td>
                    <td class="borderTopLeft col_69" align="center">4</td>
                    <td class="borderTopLeft col_69" align="center">5</td>
                    <td class="borderTopLeft col_69" align="center">6</td>
                    <td class="borderTopLeft col_69" align="center">7</td>
                    <td class="borderTopLeft col_69" align="center">8</td>
                    <td class="borderTopLeft col_69" align="center">9</td>
                    <td class="borderTopLeft col_69" align="center">10</td>
                    <td class="borderTopLeft col_69" align="center">11</td>
                    <td class="borderTopLeft col_69" align="center">12</td>
                    <td class="borderTopLeftRight col_69" align="center">13</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">OGÓŁEM (w. 02+07+15)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w01_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftRight" colspan="17">
                        <p align="CENTER" style="margin-bottom: 0cm">
                            <font face="Arial, sans-serif"><b>Wykonywanie dozorów</b></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Razem dozorów (w. 03-06)</td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w02_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="4">Dozory dotyczące:</td>
                    <td class="wciecie borderTopLeft" rowspan="3">warun-kowego </td>
                    <td class="wciecie borderTopLeft">zwolnienia </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w03_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">zawieszenia kary </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w04_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">umorzenia </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w05_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">orzeczenia w trybie art. 97 § 1kk albo art. 202b § 1kkw </td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w06_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Razem (w. 08+14)</td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w07_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Kara ograniczenia wolności (w. 08&lt;=w. od 09 do 11+13)</td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w08_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " rowspan="5">Formy kary ograniczenia wolności </td>
                    <td class="wciecie borderTopLeft " rowspan="5">w tym </td>
                    <td class="wciecie borderTopLeft">nieodpłatna kontrolowana praca na cele społeczne </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w09_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">kontrola miejsca pobytu z zastoso­waniem s.d.e </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w10_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">obowiązki z art. 72 § 1 pkt 4-7a kk </td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w11_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">w tym (w. 11) kara orzeczona wyłącznie w formie obowiązków z art. 72 § 1 pkt 4-7a kk </td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w12_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">potrącenie z wynagrodzenia za pracę </td>
                    <td class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w13_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Praca społecznie użyteczna art. 45 kkw</td>
                    <td class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w14_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftRight" colspan="17" align="center">
                        <p align="CENTER" style="margin-bottom: 0cm">
                            <font face="Arial, sans-serif"><b>Inne niż wymienione wyżej zadania kuratorów dla dorosłych</b></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Razem inne zadania (w. 16-21) </td>
                    <td class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w15_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Kontrola wykonania obowiązków przez skazanego w okresie próby bez dozoru </td>
                    <td class="borderTopLeft col_36">16</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w16_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Przygotowanie skazanego do zwolnienia z zakładu karnego </td>
                    <td class="borderTopLeft col_36">17</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w17_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Nadzory wykonywane na podstawie art. 181a § 2 kkw </td>
                    <td class="borderTopLeft col_36">18</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w18_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Wykonywanie kary pozbawienia wolności w s.d.e. </td>
                    <td class="borderTopLeft col_36">19</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w19_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Wykonywanie środków karnych w s.d.e </td>
                    <td class="borderTopLeft col_36">20</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w20_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>

                <tr>
                    <td class="wciecie borderTopLeftBottom" colspan="3">Wykonywanie środków zabezpieczających w s.d.e. </td>
                    <td class="borderTopLeftBottom col_36">21</td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_69"><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_c111_w21_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>

            <br />
        </div>
        <div class="page-break">

            <br />
            <strong><font face="Arial, sans-serif"><font size="2" style="font-size: 11pt"><b>Dział 1.A </b></font></font></strong>&nbsp;Wykonywanie pracy społecznie użytecznej w karze ograniczenia wolności oraz orzeczonej na&nbsp;podstawie art. 45 kkw (Godziny pracy)
           <br />
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="2" rowspan="2">Wyszczególnienie</td>
                    <td align="center" class="borderTopLeft" rowspan="2">Liczba godzin pracy pozostałych do wykonania w ostatnim dniu poprzedniego roku </td>
                    <td align="center" class="borderTopLeft" rowspan="2">Liczba godzin pracy, która wpłynęła do wykonania w&nbsp;okresie sprawozdawczym </td>
                    <td align="center" class="borderTopLeft" colspan="3">Liczba zakończonych godzin pracy w okresie sprawozdawczym </td>
                    <td align="center" class="borderTopLeftRight" rowspan="2">Liczba godzin pracy pozostałych do wykonania w ostatnim dniu okresu sprawozdawczego </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft">Na skutek faktycznego wykonania pracy </td>
                    <td align="center" class="borderTopLeft">Z&nbsp;innych przyczyn </td>
                    <td align="center" class="borderTopLeft">Razem </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="2">0</td>
                    <td align="center" class="borderTopLeft col_120">1</td>
                    <td align="center" class="borderTopLeft col_120">2</td>
                    <td align="center" class="borderTopLeft col_120">3</td>
                    <td align="center" class="borderTopLeft col_120">4</td>
                    <td align="center" class="borderTopLeft col_120">5</td>
                    <td align="center" class="borderTopLeftRight col_120">6</td>
                </tr>
                <tr>
                    <td class="borderTopLeft">Razem wykonywanie kary ograniczenia wolności (w. 01 = w. 02+03) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft">Kara ograniczenia wolności </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom">Praca społecznie użyteczna art. 45 kkw </td>
                    <td class="borderTopLeftBottom col_36">03</td>
                    <td class="borderTopLeftBottom col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C11a_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>

        <div class="page-break">

            <strong>Dział 1.1 </strong>Liczba spraw zawieszonych w postępowaniu wykonawczym w ostatnim dniu okresu sprawozdawczego
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " rowspan="2" align="center" colspan="3">Sprawy wg wykazów</td>
                    <td class="borderTopLeft col_36" rowspan="2">l.p.</td>
                    <td class="borderTopLeftRight" align="center" colspan="8">Czas trwania zawieszenia</td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">razem r. 2 do 8 </td>
                    <td class="borderTopLeft " align="center">do 3 mies. </td>
                    <td class="borderTopLeft " align="center">pow. 3 do 6 mies. </td>
                    <td class="borderTopLeft " align="center">pow. 6 do 12 mies. </td>
                    <td class="borderTopLeft " align="center">pow. 12 mies. do 2 lat </td>
                    <td class="borderTopLeft " align="center">pow. 2 do 3 lat </td>
                    <td class="borderTopLeft " align="center">pow. 3 do 5 lat </td>
                    <td class="borderTopLeftRight col_100" align="center">pow. 5 lat </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="4" align="center">0</td>
                    <td class="borderTopLeft" align="center">1</td>
                    <td class="borderTopLeft" align="center">2</td>
                    <td class="borderTopLeft" align="center">3</td>
                    <td class="borderTopLeft" align="center">4</td>
                    <td class="borderTopLeft" align="center">5</td>
                    <td class="borderTopLeft" align="center">6</td>
                    <td class="borderTopLeft" align="center">7</td>
                    <td class="borderTopLeftRight col_100" align="center">8</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="11">Doz</td>
                    <td class="wciecie borderTopLeft" colspan="2">ogółem (w.01 = w.02 + 07) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">kuratora zawodowego (razem w. od 03 do 06) </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="4">w tym</td>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego przedterminowego zwolnienia </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w03_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego zawieszenia wykonania kary </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w04_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego umorzenia postępowania </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w05_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">inne </td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w06_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">kuratora społecznego (razem w. od 08 do 11) </td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w07_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="4">w tym</td>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego przedterminowego zwolnienia </td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w08_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego zawieszenia wykonania kary </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w09_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">dotyczące warunkowego umorzenia postępowania </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w10_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">inne </td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w11_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="3">O</td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w12_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" colspan="3">Kkow</td>
                    <td class="borderTopLeftBottom col_36">13</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_c1111_w13_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział. 2.1</strong> Wnioski kuratorów zawodowych dla dorosłych
		      <br />
            <br />
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="6" rowspan="2">Wyszczególnienie</td>
                    <td class="borderTopLeftRight" colspan="3" align="center">Liczby wniosków</td>
                </tr>
                <tr>
                    <td class="borderTopLeft col_100">wniesionych</td>
                    <td class="borderTopLeft col_100">rozpatrzonych </td>
                    <td class="borderTopLeftRight col_100">w tym uwzględnioneych </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="6">0</td>
                    <td class="borderTopLeft col_100">1</td>
                    <td class="borderTopLeft col_100">2</td>
                    <td class="borderTopLeftRight col_100">3</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="5">Wnioski ogółem (w. 02 + 09 + 21 + 26 + 33 + 34) (w okresie sprawozdawczym)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="33">&nbsp;</td>
                    <td class="borderTopLeft wciecie col_100" rowspan="7">warunkowego zwolnienia</td>
                    <td class="borderTopLeft wciecie" colspan="3">razem (w.03+05+06+08) </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o ustanowienie, rozszerzenie lub zmianę obowiązków w okresie próby (art. 163 § 2 kkw w zw. z art. 72 § 1 kk i w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">w tym o uczestnictwo w programie korekcyjno-edukacyjnym </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o zwolnienie od dozoru (art. 163 § 2 kkw w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w05_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w05_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="2">o odwołanie warunkowego zwolnienia (art. 160 § 1-4 kkw w zw. z art. 173 § 2 pkt 7 kkw) </td>
                    <td class="borderTopLeft wciecie" colspan="2">razem </td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w06_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w06_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">w tym przy zastosowaniu art. 12d ustawy z dnia 29 lipca 2005 r. o przeciwdziałaniu przemocy w rodzinie (Dz.U. 2015 poz. 1390) </td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w07_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w07_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">inne rodzaje wniosków (np. o zmianę okresu próby na podstawie art. 163 § 2 kkw w zw. z art. 173 § 2 pkt 3 kkw)</td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w08_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w08_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="12">warunkowego
                        <br />
                        zawieszenia<br />
                        &nbsp;kary</td>
                    <td class="borderTopLeft wciecie" colspan="3">razem (w.10+16 do 18+20) </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w09_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w09_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w09_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o ustanowienie, rozszerzenie lub zmianę obowiązków w okresie próby (art. 74 § 2 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w10_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w10_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w10_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie col_100" rowspan="5">w tym o </td>
                    <td class="borderTopLeft wciecie" colspan="2">uczestnictwo w programie korekcyjno-edukacyjnym</td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w11_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w11_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w11_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="3">powstrzymanie się od </td>
                    <td class="borderTopLeft wciecie">przebywania w określonych miejscach (art. 72 § 1 pkt 7 kk) </td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w12_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w12_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w12_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">kontaktowania się z pokrzywdzonym lub innymi osobami w określony sposób (art. 72 § 1 pkt 7a kk) </td>
                    <td class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w13_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w13_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w13_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">zbliżania się do pokrzywdzonego lub innych osób (art. 72 § 1 pkt 7a kk) </td>
                    <td class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w14_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w14_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w14_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">opuszczenie lokalu zajmowanego wspólnie z pokrzywdzonym (art. 72 § 1 pkt 7b kk) </td>
                    <td class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w15_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w15_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w15_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o zwolnienie od dozoru (art. 74 § 2 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">16</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w16_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w16_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w16_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o oddanie pod dozór (art. 74 § 2 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">17</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w17_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w17_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w17_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="2">o zarządzenie wykonania kary
                        <br />
                        (art. 75 § 1-2a kk w zw.
                        <br />
                        z art. 173 § 2 pkt 8) </td>
                    <td class="borderTopLeft wciecie" colspan="2">razem </td>
                    <td class="borderTopLeft col_36">18</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w18_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w18_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w18_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">w tym przy zastosowaniu art. 12d ustawy z dnia 29 lipca 2005 r. o przeciwdziałaniu przemocy w rodzinie (Dz.U. 2015 poz. 1390) </td>
                    <td class="borderTopLeft col_36">19</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w19_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w19_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w19_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">inne rodzaje wniosków </td>
                    <td class="borderTopLeft col_36">20</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w20_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w20_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w20_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>

                <tr>
                    <td class="borderTopLeft wciecie" rowspan="5">kary<br />
                        &nbsp;ograniczenia
                        <br />
                        wolności i pracy
                        <br />
                        społecznie
                        <br />
                        użytecznej
                        <br />
                        orzeczonej
                        <br />
                        na podstawie
                        <br />
                        art. 45 kkw
                        <br />
                        i 25 § 1 kw</td>
                    <td class="borderTopLeft wciecie" colspan="3">razem (w. 22 do 25) </td>
                    <td class="borderTopLeft col_36">21</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w21_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w21_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w21_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o zarządzenie wykonania kary zastępczej (art. 65 § 1 kkw w zw. z art. 66 § 1 kkw oraz art. 46§ 1 kkw i art. 25§ 2 kw) </td>
                    <td class="borderTopLeft col_36">22</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w22_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w22_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w22_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o zwolnienie od reszty kary (art. 83 kk w zw. z art. 66 § 1 kkw) </td>
                    <td class="borderTopLeft col_36">23</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w23_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w23_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w23_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">dotyczące wykonywania kary w systemie dozoru elektronicznego </td>
                    <td class="borderTopLeft col_36">24</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w24_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w24_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w24_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">inne rodzaje wniosków </td>
                    <td class="borderTopLeft col_36">25</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w25_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w25_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w25_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="7">&nbsp;</td>
                    <td class="borderTopLeft wciecie" colspan="3">razem (w. 27 + 28 + 30 do 32) </td>
                    <td class="borderTopLeft col_36">26</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w26_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w26_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w26_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o podjęcie warunkowo umorzonego postępowania karnego (art. 68 kk w zw. z art. 549 kpk w zw. z art. 173 § 2 pkt 4 kkw) </td>
                    <td class="borderTopLeft col_36">27</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w27_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w27_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w27_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o ustanowienie, rozszerzenie lub zmianę obowiązków w okresie próby (art. 67 § 3 i § 4 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">28</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w28_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w28_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w28_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">w tym o uczestnictwo w programie korekcyjno-edukacyjnym </td>
                    <td class="borderTopLeft col_36">29</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w29_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w29_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w29_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o zwolnienie od dozoru (art. 67 § 2 i § 4 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">30</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w30_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w30_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w30_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>

                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">o oddanie pod dozór (art. 67 § 2 i § 4 kk w zw. z art. 173 § 2 pkt 5 kkw) </td>
                    <td class="borderTopLeft col_36">31</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w31_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w31_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w31_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="3">inne rodzaje wniosków </td>
                    <td class="borderTopLeft col_36">32</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w32_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w32_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w32_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="4">wykonywania kary pozbawienia wolności, środka karnego i środka zabezpieczającego w systemie dozoru elektronicznego </td>
                    <td class="borderTopLeft col_36">33</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w33_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w33_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w33_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" colspan="4">pozostałe rodzaje wniosków (np. o udzielenie przerwy w karze pozbawienia wolności, o odroczenie kary, o odwołanie przerwy w karze, o odwołanie odroczenia kary, o rozstrzygnięcie wątpliwości co do wykonania wyroku) </td>
                    <td class="borderTopLeftBottom col_36">34</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w34_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w34_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C121_w34_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>

        <div class="page-break">

            <strong>Dział. 2.2.</strong> Upomnienia kuratorów zawodowych dla dorosłych
		      <br />
            <br />
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Liczba udzielonych upomnień</td>
                    <td class="borderTopLeftRight" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeftRight col_100">1</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Upomnienia ogółem (w. 02 do 04) (w okresie sprawozdawczym) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C122_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="29">W tym upomnienia dotyczące </td>
                    <td class="borderTopLeft wciecie">warunkowego przedterminowego zwolnienia </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C122_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">warunkowego zawieszenia wykonania kary </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C122_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">warunkowego umorzenia postępowania </td>
                    <td class="borderTopLeftBottom col_36">04</td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C122_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>

        <div class="page-break">
            <strong>Dział. 2.3.</strong> Posiedzenia wykonawcze<br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td rowspan="3" class="wciecie">Liczba posiedzeń, w których uczestniczyli kuratorzy zawodowi (na które zostali wezwani lub o których zostali zawiadomieni)</td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C123_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>

        <div class="page-break">

            <strong>
                <br />
                Dział. 3. </strong>Wywiady przeprowadzone przez kuratorów dla dorosłych
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " rowspan="4" align="center" colspan="2">Wyszczególnienia</td>
                    <td class="borderTopLeft col_29" rowspan="4">L.p.</td>
                    <td class="borderTopLeftRight" align="center" colspan="11">Wywiady</td>
                </tr>
                <tr>
                    <td class="borderTopLeft " rowspan="3" align="center">ogółem we wszystkich fazach postępowania karnego (rubr. 2+6+10)</td>
                    <td class="borderTopLeft " align="center" colspan="9">zarządzone w postępowaniu </td>
                    <td class="borderTopLeftRight" rowspan="3" align="center">Kontrolne kuratora zawodowego w dozorach powierzonych </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" colspan="4">przygotowawczym i sądowym (art. 214 kpk) </td>
                    <td class="borderTopLeft " align="center" colspan="4">wykonawczym (art. 14 kkw) </td>
                    <td class="borderTopLeft " rowspan="2" align="center">wykonawczym – zebranie informacji w trybie art. 43h § 4 kkw </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">razem (rubr. 4+5) </td>
                    <td class="borderTopLeft " align="center">w tym obowiąz­kowe (art. 214 § 2 kpk) </td>
                    <td class="borderTopLeft " align="center">sąd </td>
                    <td class="borderTopLeft " align="center">prokuratura </td>
                    <td class="borderTopLeft " align="center">razem (rubr. 7 do 9) </td>
                    <td class="borderTopLeft " align="center">sąd</td>
                    <td class="borderTopLeft " align="center">zakład karny </td>
                    <td class="borderTopLeft " align="center">inny organ </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="3" align="center">0</td>
                    <td class="borderTopLeft col_100" align="center">1</td>
                    <td class="borderTopLeft col_100" align="center">2</td>
                    <td class="borderTopLeft col_100" align="center">3</td>
                    <td class="borderTopLeft col_100" align="center">4</td>
                    <td class="borderTopLeft col_100" align="center">5</td>
                    <td class="borderTopLeft col_100" align="center">6</td>
                    <td class="borderTopLeft col_100" align="center">7</td>
                    <td class="borderTopLeft col_100" align="center">8</td>
                    <td class="borderTopLeft col_100" align="center">9</td>
                    <td class="borderTopLeft col_100" align="center">10</td>
                    <td class="borderTopLeftRight col_100" align="center">11</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Razem wywiady (w.01 = w.02+03) </td>
                    <td class="borderTopLeft col_29">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" rowspan="2">Przeprowadzo­ne przez kuratora </td>
                    <td class="wciecie borderTopLeft">zawodowego </td>
                    <td class="borderTopLeft col_29">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w02_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom">społecznego </td>
                    <td class="borderTopLeftBottom col_29">03</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C13_w03_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział. 4. </strong>Zakres podmiotowy, przedmiotowy i wysokość świadczonej pomocy postpenitencjarnej
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderAll center" rowspan="2">Wyszczególnienia</td>
                    <td class="borderAll center" rowspan="2">L.p.</td>
                    <td class="borderAll center" colspan="2">Liczba wniosków o udzielenie pomocy </td>
                    <td class="borderAll center" colspan="3">Liczba osób, którym udzielono pomocy </td>
                    <td class="borderAll center" colspan="7">Wydatkowanie środków z funduszu pomocy postpenitencjarnej (w złotych) </td>
                </tr>
                <tr>
                    <td class="col_80_fest_fest borderAll">złożonych </td>
                    <td class="col_80_fest_fest borderAll">uwzględ-nionych </td>
                    <td class="col_80_fest_fest borderAll">razem (kol. 4+5 )</td>
                    <td class="col_80_fest_fest borderAll">na wniosek</td>
                    <td class="col_80_fest_fest borderAll">z urzędu</td>
                    <td class="col_80_fest_fest borderAll">razem </td>
                    <td class="col_80_fest_fest borderAll">świadczenia pieniężne </td>
                    <td class="col_80_fest_fest borderAll">bony</td>
                    <td class="col_80_fest_fest borderAll">finansowanie zakupów żywności, odzieży, leków, itp.</td>
                    <td class="col_80_fest_fest borderAll">opłacanie czynszu, tymcza-sowego zakwate-rowania</td>
                    <td class="col_80_fest_fest borderAll">pokrywanie kosztów kursów zawodowych, porad i leczenia specjalis-tycznego</td>
                    <td class="col_80_fest_fest borderAll">inne</td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="2" align="center">0</td>
                    <td class="col_80_fest_fest borderAll">1</td>
                    <td class="col_80_fest_fest borderAll">2</td>
                    <td class="col_80_fest_fest borderAll">3</td>
                    <td class="col_80_fest_fest borderAll">4</td>
                    <td class="col_80_fest_fest borderAll">5</td>
                    <td class="col_80_fest_fest borderAll">6</td>
                    <td class="col_80_fest_fest borderAll">7</td>
                    <td class="col_80_fest_fest borderAll">8</td>
                    <td class="col_80_fest_fest borderAll">9</td>
                    <td class="col_80_fest_fest borderAll">10</td>
                    <td class="col_80_fest_fest borderAll" align="center">11</td>
                    <td class="col_80_fest_fest borderAll" align="center">12</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">Razem (w.01 = w.02 do 04) </td>
                    <td class="borderTopLeft col_29">01</td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">Członkowie rodzin osób pozbawionych wolności </td>
                    <td class="borderTopLeft col_29">02</td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w02_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">Osoby zwalniane z jednostek penitencjarnych </td>
                    <td class="borderTopLeft col_29">03</td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w03_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom">Członkowie rodzin osób zwalnianych z jednostek penitencjarnych </td>
                    <td class="borderTopLeftBottom col_29">04</td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_80_fest_fest borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C14_w04_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Część II. </strong>ZADANIA WYKONYWANE W ZESPOŁACH KURATORSKIEJ SŁUŻBY SĄDOWEJ WYKONUJĄCEJ ORZECZENIA W SPRAWACH RODZINNYCH I NIELETNICH<strong>
                    <br />
                    <br />
                    Dział. 1 </strong>Ewidencja wykonywanych zadań
           <br />
            <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " rowspan="4" align="center" colspan="2">Wyszczególnienieszczególnienie</td>
                    <td class="borderTopLeft col_36" rowspan="4">L.p.</td>
                    <td class="borderTopLeft " align="center" colspan="4">Stan w ostatnim dniu poprzedniego roku </td>
                    <td class="borderTopLeft " align="center" colspan="2" rowspan="2">Wpłynęło do zespołu w okresie sprawozdawczym </td>
                    <td class="borderTopLeft " align="center" colspan="2" rowspan="2">Zakończono postępowanie w okresie sprawozdawczym</td>
                    <td class="borderTopLeftRight" align="center" colspan="4">Stan w ostatnim dniu okresu sprawozdawczego</td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="3">Spraw (kol. 2+3) </td>
                    <td class="borderTopLeft " align="center" colspan="2" rowspan="2">wykonywanych przez: </td>
                    <td class="borderTopLeft " align="center" rowspan="3">Osób objętych postępo-waniem </td>
                    <td class="borderTopLeft " align="center" rowspan="3">Spraw (kol. 2+3) </td>
                    <td class="borderTopLeft " align="center" colspan="2" rowspan="2">wykonywanych przez: </td>
                    <td class="borderTopLeftRight" align="center" rowspan="3">Osób objętych postępo-waniem </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="2">spraw</td>
                    <td class="borderTopLeft " align="center" rowspan="2">w tym przekazanych z innych zespołów</td>
                    <td class="borderTopLeft " align="center" rowspan="2">spraw</td>
                    <td class="borderTopLeft " align="center" rowspan="2">w tym przekazanych z innych zespołów</td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">kuratora zawodowego </td>
                    <td class="borderTopLeft " align="center">kuratora społecznego </td>
                    <td class="borderTopLeft " align="center">kuratora zawodowego </td>
                    <td class="borderTopLeft " align="center">kuratora społecznego </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="3" align="center">0</td>
                    <td class="borderTopLeft" align="center">1</td>
                    <td class="borderTopLeft" align="center">2</td>
                    <td class="borderTopLeft" align="center">3</td>
                    <td class="borderTopLeft" align="center">4</td>
                    <td class="borderTopLeft" align="center">5</td>
                    <td class="borderTopLeft" align="center">6</td>
                    <td class="borderTopLeft" align="center">7</td>
                    <td class="borderTopLeft" align="center">8</td>
                    <td class="borderTopLeft" align="center">9</td>
                    <td class="borderTopLeft" align="center">10</td>
                    <td class="borderTopLeft" align="center">11</td>
                    <td class="borderTopLeftRight" align="center">12</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">OGÓŁEM (w. 02+-06) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Razem nadzory (w. 03-05) </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w02_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="3">Nadzory dotyczące spraw: </td>
                    <td class="wciecie borderTopLeft">opiekuńczych </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w03_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">nieletnich </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w04_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">leczenia odwykowego </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w05_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Razem inne zadania (w. 7+10 do 12)</td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w06_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="3">Opieka prawna dla:</td>
                    <td class="wciecie borderTopLeft">razem </td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w07_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">osoby małoletniej </td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w08_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">osoby dorosłej </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w09_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Udział kuratora w kontaktach rodziców z dzieckiem </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w10_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Odebranie osoby podlegającej władzy rodzicielskiej (art. 5986-13 kpc) </td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_69"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w11_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" colspan="2">Nwo – kontrola zobowiązań nałożonych na nieletnich i rodziców </td>
                    <td class="borderTopLeftBottom col_36">12</td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_69"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C2_1_w12_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział. 1.a.</strong> Udział kuratora w kontaktach rodzica z dzieckiem
		         <br />
            <br />
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Wyszczególnienie </td>
                    <td class="borderTopLeftRight col_150" align="center">Liczba kontaktów wykonanych w okresie sprawozdawczym </td>
                    <td class="borderTopLeftRight col_150" align="center">w tym liczba kontaktów wykonanych w dni wolne od pracy i dni świąteczne</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeftRight col_150">1</td>
                    <td class="borderTopLeftRight col_150">2</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Razem Liczba kontaktów (w.2+3)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="28">z tego wykonywanych przez kuratora </td>
                    <td class="borderTopLeft wciecie">zawodowego </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">społecznego </td>
                    <td class="borderTopLeftBottom col_36">03</td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.a!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.a!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C21a_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział. 2.</strong> Wnioski kuratorów i posiedzenia wykonawcze<br />

            <strong>Dział. 2.1.</strong> Wnioski kuratorów zawodowych rodzinnych
            <br />
            <br />
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3" rowspan="2">Wyszczególnienie</td>
                    <td class="borderTopLeftRight" colspan="3" align="center">Liczba wniosków </td>
                </tr>
                <tr>
                    <td class="borderTopLeft col_100">wniesionych </td>
                    <td class="borderTopLeft col_100">rozpatrzonych </td>
                    <td class="borderTopLeftRight col_100">w tym uwzględnionych</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeft col_100">1</td>
                    <td class="borderTopLeft col_100">2</td>
                    <td class="borderTopLeftRight col_100">3</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Razem (w.01 = w.02 do 16)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="3">Wnioski dotyczące spraw opiekuńczych - Opm</td>
                    <td class="borderTopLeft wciecie">o umorzenie postępowania opiekuńczego </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o zmianę sposobu ograniczenia władzy rodzicielskiej (art. 109§1 i 2 kro) </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne</td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="7">Nieletnich - Nwinne </td>
                    <td class="borderTopLeft wciecie">o zmianę lub uchylenie orzeczonego wobec nieletniego środka wychowawczego (art. 70a § 2 pkt 9 upn) </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w05_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w05_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o zmianę lub uchylenie środka wychowawczego zastosowanego w okresie próby w związku z warunkowym zwolnieniem z zakładu poprawczego oraz&nbsp;o odwołanie warunkowego zwolnienia z zakładu poprawczego (art. 70a § 2 pkt 10 upn) </td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w06_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w06_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o zarządzenie wykonania środka poprawczego (art. 70a § 2 pkt 11 upn) </td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w07_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w07_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o zmianę lub uchylenie zastosowanego względem nieletniego środka tymczasowego (art. 70a § 2 pkt 12 upn) </td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w08_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w08_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o odroczenie wykonywania środka wychowawczego lub przerwę w jego wykonywaniu, o przedłużenie odroczenia lub przerwy oraz&nbsp;o odwołanie odroczenia lub przerwy w jego wykonywaniu (art. 70a § 2 pkt 13 upn) </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w09_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w09_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w09_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o nałożenie, zmianę lub uchylenie obowiązków, o których mowa w&nbsp;art. 7 § 1, wobec rodziców lub opiekuna nieletniego (art. 70a § 2 pkt 14 upn) </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w10_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w10_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w10_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Inne </td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w11_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w11_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w11_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="3">Dorosłych - Alk </td>
                    <td class="borderTopLeft wciecie">o orzeczenie ustania obowiązku poddania się leczeniu odwykowemu (art. 34 ust. 4 ustawy z dnia 26&nbsp;października 1982 r. o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi (Dz.U. z 2016 r. poz. 487) </td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w12_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w12_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w12_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">o zmianę rodzaju zakładu leczenia odwykowego (art.&nbsp;34 ust. 2 ustawy z dnia 26 października 1982&nbsp;r. o wychowaniu w trzeźwości i przeciwdziałaniu alkoholiz­mowi) </td>
                    <td class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w13_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w13_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w13_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne</td>
                    <td class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w14_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w14_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w14_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="2">Inne kierowane do </td>
                    <td class="borderTopLeft wciecie">sądu </td>
                    <td class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w15_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w15_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w15_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">podmiotów innych niż sąd </td>
                    <td class="borderTopLeftBottom col_36">16</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!2.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w16_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!2.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w16_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!2.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C221_w16_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <div>

            <strong>Dział. 2.2.</strong> Posiedzenia wykonawcze

           <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="wciecie">Liczba posiedzeń, w których uczestniczyli kuratorzy zawodowi (na które zostali wezwani lub o których zostali zawiadomieni)</td>

                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=15!2.2.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C222_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>

        <div class="page-break">

            <strong>
                <br />
                Dział. 3 </strong>Wywiady przeprowadzone przez kuratorów rodzinnych
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " rowspan="4" align="center">Wyszczególnienie</td>
                    <td class="borderTopLeft col_36" rowspan="4">L.p.</td>
                    <td class="borderTopLeft " align="center" colspan="5">Wywiady</td>
                    <td class="borderTopLeftRight" align="center" rowspan="4">Wywiady kontrolne kuratora zawodowego w nadzorach powierzonych </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="3">ogółem w postępowaniu rozpoznawczym i postępowaniu wykonawczym (kol. 2+5)</td>
                    <td class="borderTopLeft " align="center" colspan="3">w postępowaniu rozpoznawczym<sup><span class="auto-style2">a)</span></sup></td>
                    <td class="borderTopLeft " align="center" rowspan="3">w postępowaniu wykonawczym </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="2">ogółem</td>
                    <td class="borderTopLeft " align="center" colspan="2">w tym w sprawach </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">nieletnich (Nkd) </td>
                    <td class="borderTopLeft " align="center">o rozwód lub separację&nbsp; </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="2" align="center">0</td>
                    <td class="borderTopLeft" align="center">1</td>
                    <td class="borderTopLeft" align="center">2</td>
                    <td class="borderTopLeft" align="center">3</td>
                    <td class="borderTopLeft" align="center">4</td>
                    <td class="borderTopLeft" align="center">5</td>
                    <td class="borderTopLeftRight" align="center">6</td>
                </tr>
                <tr>
                    <td class="borderTopLeft">Razem (w.01 = w.02 + 03) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C23_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>

                <td class="wciecie borderTopLeft">Kurator zawodowy </td>
                <td class="borderTopLeft col_36">02</td>
                <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!1!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c01" runat="server" Text="0"></asp:Label>
                </a></td>
                <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!2!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c02" runat="server" Text="0"></asp:Label>
                </a></td>
                <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!3!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c03" runat="server" Text="0"></asp:Label>
                </a></td>
                <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!4!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c04" runat="server" Text="0"></asp:Label>
                </a></td>
                <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!5!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c05" runat="server" Text="0"></asp:Label>
                </a></td>
                <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!6!4')">
                    <asp:Label CssClass="normal" ID="tab_C23_w02_c06" runat="server" Text="0"></asp:Label>
                </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom">Kurator społeczny </td>
                   <td class="borderTopLeftBottom col_36">03</td>
                   <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!1!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c01" runat="server" Text="0"></asp:Label>
                   </a></td>
                   <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!2!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c02" runat="server" Text="0"></asp:Label>
                   </a></td>
                   <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!3!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c03" runat="server" Text="0"></asp:Label>
                   </a></td>
                   <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!4!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c04" runat="server" Text="0"></asp:Label>
                   </a></td>
                   <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!5!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c05" runat="server" Text="0"></asp:Label>
                   </a></td>
                   <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!6!4')">
                       <asp:Label CssClass="normal" ID="tab_C23_w03_c06" runat="server" Text="0"></asp:Label>
                   </a></td>
               </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział. 4. </strong>Ośrodki kuratorskie<br />
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Wyszczególnienia</td>
                    <td align="center" class="borderTopLeft">L.P.</td>
                    <td align="center" class="col_168 borderTopLeftRight">Liczby<br />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="4">0</td>
                    <td align="center" class="col_168 borderTopLeftRight">1</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="4">Ośrodki</td>
                    <td class="wciecie borderTopLeft" colspan="2">stan w ostatnim dniu poprzedniego roku </td>
                    <td align="center" class="borderTopLeft col_36">01</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">przybyło </td>
                    <td class="wciecie borderTopLeft" rowspan="2">w okresie sprawozdawczym </td>
                    <td align="center" class="borderTopLeft col_36">02</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">ubyło </td>
                    <td align="center" class="borderTopLeft col_36">03</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">stan w ostatnim dniu okresu sprawozdawczego </td>
                    <td align="center" class="borderTopLeft col_36">04</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=4!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="4">Nieletni</td>
                    <td class="wciecie borderTopLeft" colspan="2">stan w ostatnim dniu poprzedniego roku </td>
                    <td align="center" class="borderTopLeft col_36">05</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=5!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w05_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">przybyło </td>
                    <td class="wciecie borderTopLeft" rowspan="2">w okresie sprawozdawczym </td>
                    <td align="center" class="borderTopLeft col_36">06</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=6!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w06_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">ubyło </td>
                    <td align="center" class="borderTopLeft col_36">07</td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=7!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w07_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" colspan="2">stan w ostatnim dniu okresu sprawozdawczego </td>
                    <td align="center" class="borderTopLeftBottom col_36">08</td>
                    <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!2.4!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C24_w08_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">

            <strong>Część III. KURATORSKA SŁUŻBA SĄDOWA </strong>
            <br />
            <br />
            <strong>Dział 1.1. </strong>Limity i obsady sądu czy okręgu (zespoły kurateli dla dorosłych i kurateli rodzinnej w tym w ramach zespołów połączonych)
           <br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderAll" align="center" colspan="2">Ogółem </td>
                    <td class="borderAll" align="center" colspan="13">kuratela dla dorosłych </td>
                    <td class="borderAll" colspan="13" align="center">kuratela rodzinna </td>
                </tr>
                <tr>
                    <td class="borderAll" rowspan="2" align="center">limit etatów według stanu na ostatni dzień okresu statystycznego </td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa </td>
                    <td class="borderAll" align="center" colspan="2">Limity i obsady kurateli dla dorosłych z wyłączeniem Kuratorów Okręgowych i ich zastępców</td>
                    <td class="borderAll" align="center" rowspan="2">kierownicy zespołu (ów) </td>
                    <td class="borderAll" align="center" rowspan="2">aplikanci w ramach limitu (kuratela dla dorosłych) </td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy delegowani do Ministerstwa Sprawied-liwości</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa delegowanych do Ministerstwa Sprawied-liwości (czas delegacji)</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy delegowani do sądu okręgowego do pomocy kuratorowi okręgowemu</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa delegowanych do sądu okręgowego (czas delegacji)</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy przeniesieni do innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa przeniesionych do innego zespołu kurateli (czas przeniesienia) </td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy przeniesieni z innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnioo-kresowa przeniesionych z innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy społeczni kurateli dla dorosłych </td>
                    <td class="borderAll" align="center" colspan="2">Limity i obsady kurateli rodzinnej z wyłączeniem Kuratorów Okręgowych i ich zastępców</td>
                    <td class="borderAll" align="center" rowspan="2">kierownicy zespołu (ów) </td>
                    <td class="borderAll" align="center" rowspan="2">aplikanci w ramach limitu (kuratela rodzinna) </td>

                    <td class="borderAll" align="center" rowspan="2">kuratorzy delegowani do Ministerstwa Sprawie-dliwości</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa delegowanych do Ministerstwa Sprawied-liwości (czas delegacji)</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy delegowani do sądu okręgowego do pomocy kuratorowi okręgowemu</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa delegowanych do sądu okręgowego (czas delegacji)</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy przeniesieni do innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnio-okresowa przeniesionych do innego zespołu kurateli (czas przeniesienia) </td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy przeniesieni z innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">obsada średnioo-kuratorzy społeczni kurateli rodzinnej kresowa przeniesionych z innego zespołu kurateli</td>
                    <td class="borderAll" align="center" rowspan="2">kuratorzy społeczni kurateli rodzinnej  </td>
                </tr>
                <tr>
                    <td class="borderAll" align="center">limit etatów według stanu na ostatni dzień okresu statystycznego </td>
                    <td class="borderAll" align="center">obsada średnio-okresowa </td>
                    <td class="borderAll" align="center">limit etatów według stanu na ostatni dzień okresu statystycznego </td>
                    <td class="borderAll" align="center">obsada średnio-okresowa </td>
                </tr>
                <tr>
                    <td class="borderAll col_120" align="center">1</td>
                    <td class="borderAll col_120" align="center">2</td>
                    <td class="borderAll col_120" align="center">3</td>
                    <td class="borderAll col_120" align="center">4</td>
                    <td class="borderAll col_120" align="center">5</td>
                    <td class="borderAll col_120" align="center">6</td>
                    <td class="borderAll col_120" align="center">7</td>
                    <td class="borderAll col_120" align="center">8</td>
                    <td class="borderAll col_120" align="center">9</td>
                    <td class="borderAll col_120" align="center">10</td>
                    <td class="borderAll col_120" align="center">11</td>
                    <td class="borderAll col_120" align="center">12</td>
                    <td class="borderAll col_120" align="center">13</td>
                    <td class="borderAll col_120" align="center">14</td>
                    <td class="borderAll col_120" align="center">15</td>
                    <td class="borderAll col_120" align="center">16</td>
                    <td class="borderAll col_120" align="center">17</td>
                    <td class="borderAll col_120" align="center">18</td>
                    <td class="borderAll col_120" align="center">19</td>
                    <td class="borderAll col_120" align="center">20</td>
                    <td class="borderAll col_120" align="center">21</td>
                    <td class="borderAll col_120" align="center">22</td>
                    <td class="borderAll col_120" align="center">23</td>
                    <td class="borderAll col_120" align="center">24</td>
                    <td class="borderAll col_120" align="center">25</td>
                    <td class="borderAll col_120" align="center">26</td>
                    <td class="borderAll col_120" align="center">27</td>
                    <td class="borderAll col_120" align="center">28</td>
                </tr>
                <tr>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>

                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c14" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c15" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c16" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c17" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c18" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c19" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c20" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c21" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c22" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c23" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c24" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c25" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c26" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c27" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_C311_w01_c28" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>

        <div class="page-break">

            <strong>
                <br />
                Dział 1.2. Limity i obsady obsługi biurowej zespołu (sądu, okręgu) </strong>

            <br />
            <br />
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="2">Wyszczególnienie</td>
                    <td align="center" class="borderTopLeft">L.P.</td>
                    <td align="center" class="col_168 borderTopLeft">Liczba etatów pracowniczych obsługujących kuratelę według stanu na ostatni dzień okresu statystycznego </td>
                    <td align="center" class="col_168 borderTopLeftRight">Obsada średniookresowa </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td align="center" class="col_168 borderTopLeft">1</td>
                    <td align="center" class="col_168 borderTopLeftRight">2&nbsp;</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" rowspan="3">Pracownicy wykonujący zadania na rzecz zespołów </td>
                    <td class="wciecie borderTopLeft">Ogółem (w. 01=w. 02+03) </td>
                    <td align="center" class="borderTopLeft col_36">01</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft">Zatrudnieni w zespołach kuratorskich (art. 42 ust. 2 u.o.k.s.) </td>
                    <td align="center" class="borderTopLeft col_36">02</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom">Zatrudnieni poza zespołami kuratorskimi (w tym art. 42 ust. 1 u.o.k.s.) </td>
                    <td align="center" class="borderTopLeftBottom col_36">03</td>
                    <td class="col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C312_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>

            <br />
        </div>
        <div class="page-break">

            <br />
            <strong>Dział 1.3. </strong>Liczba zespołów kuratorskich i realizacja art. 42 ust. 1 i 2 ustawy z dnia 27 lipca 2001 r. o kuratorach sądowych (Dz. u. Nr 98, poz. 1071, z późn. zm.) (sądu, okręgu)<br />
            <br />

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="4">&nbsp;</td>
                    <td class="borderTopLeft " align="center" colspan="4">Zespoły połączone </td>
                    <td class="borderTopLeft " align="center" colspan="4">Zespoły dla kuratorów dorosłych </td>
                    <td class="borderTopLeftRight" align="center" colspan="4">Zespoły dla kuratorów rodzinnych </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" rowspan="3">ogółem (kol. 2=3+4+5) </td>
                    <td class="borderTopLeft " align="center" colspan="2">w tym </td>
                    <td class="borderTopLeft " align="center" rowspan="3">liczba zespołów bez obsługi </td>
                    <td class="borderTopLeft " align="center" rowspan="3">ogółem (kol. 2=3+4+5) </td>
                    <td class="borderTopLeft " align="center" colspan="2">w tym </td>
                    <td class="borderTopLeft " align="center" rowspan="3">liczba zespołów bez obsługi </td>
                    <td class="borderTopLeft " align="center" rowspan="3">ogółem (kol. 2=3+4+5) </td>
                    <td class="borderTopLeft " align="center" colspan="2">w tym </td>
                    <td class="borderTopLeftRight" align="center" rowspan="3">liczba zespołów bez obsługi </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center" colspan="2">zespoły z obsługą administracyjną w trybie art. </td>
                    <td class="borderTopLeft " align="center" colspan="2">zespoły z obsługą administracyjną w trybie art. </td>
                    <td class="borderTopLeft " align="center" colspan="2">zespoły z obsługą administracyjną w trybie art. </td>
                </tr>
                <tr>
                    <td class="borderTopLeft " align="center">42 ust.1 (u.o.k.s.) </td>
                    <td class="borderTopLeft " align="center">42 ust.2 (u.o.k.s.) </td>
                    <td class="borderTopLeft " align="center">42 ust.1 (u.o.k.s.) </td>
                    <td class="borderTopLeft " align="center">42 ust.2 (u.o.k.s.) </td>
                    <td class="borderTopLeft " align="center">42 ust.1 (u.o.k.s.) </td>
                    <td class="borderTopLeft " align="center">42 ust.2 (u.o.k.s.) </td>
                </tr>
                <tr>
                    <td class="borderTopLeft" align="center">1</td>
                    <td class="borderTopLeft" align="center">2</td>
                    <td class="borderTopLeft" align="center">3</td>
                    <td class="borderTopLeft" align="center">4</td>
                    <td class="borderTopLeft" align="center">5</td>
                    <td class="borderTopLeft" align="center">6</td>
                    <td class="borderTopLeft" align="center">7</td>
                    <td class="borderTopLeft" align="center">8</td>
                    <td class="borderTopLeft" align="center">9</td>
                    <td class="borderTopLeft" align="center">10</td>
                    <td class="borderTopLeft" align="center">11</td>
                    <td class="borderTopLeft" align="center">12</td>
                    <td class="borderTopLeftRight" align="center">13</td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!4!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!5!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!6!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!7!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!8!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!9!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!10!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!11!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!12!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.3!13!4')">
                        <asp:Label CssClass="normal" ID="tab_C313_w01_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <strong>
                <br />
                Część&nbsp; IV.
           <br />
                Dział 1.1. </strong>Udział kuratorów sądowych (zawodowych i społecznych) w wykonywaniu ustawy o przeciwdziałaniu przemocy w rodzinie<br />
            <br />
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="2" rowspan="2">Wyszczególnienie</td>
                    <td align="center" class="borderTopLeft" rowspan="2">L.P.</td>
                    <td align="center" class="col_168 borderTopLeft" rowspan="2">Ogółem (kol. 2+3)</td>
                    <td align="center" class="borderTopLeftRight" colspan="2">Dotyczy kuratorów </td>
                </tr>
                <tr>
                    <td align="center" class="col_168 borderTopLeft">dla dorosłych </td>
                    <td align="center" class="col_168 borderTopLeftRight">rodzinnych </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td align="center" class="col_168 borderTopLeft">1</td>
                    <td align="center" class="col_168 borderTopLeft">2</td>
                    <td align="center" class="col_168 borderTopLeftRight">3</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="2">Liczba kuratorów sądowych, którzy w okresie statystycznym wchodzili w skład </td>
                    <td class="wciecie borderTopLeft col_300">zespołów interdyscyplinarnych </td>
                    <td align="center" class="borderTopLeft col_36">01</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft col_300">grup roboczych </td>
                    <td align="center" class="borderTopLeft col_36">02</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" rowspan="2">Liczba kuratorów sądowych, którzy w ostatnim dniu okresu statystycznego wchodzili w skład </td>
                    <td class="wciecie borderTopLeft col_300">zespołów interdyscyplinarnych </td>
                    <td align="center" class="borderTopLeft col_36">03</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom col_300">grup roboczych </td>
                    <td align="center" class="borderTopLeftBottom col_36">04</td>
                    <td class="col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C411_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>

            <br />
        </div>
        <div class="page-break">

            <strong>
                <br />
                Dział 1.2. </strong>Liczba zespołów interdyscyplinarnych i grup roboczych, w których kuratorzy sądowi (zawodowi i społeczni) wykonują czynności w zakresie przeciwdziałania przemocy w rodzinie

		      <br />
            <br />
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3" rowspan="2">Wyszczególnienie</td>
                    <td align="center" class="borderTopLeft" rowspan="2">L.P.</td>
                    <td align="center" class="col_168 borderTopLeft" rowspan="2">Ogółem (kol. 2+3)</td>
                    <td align="center" class="borderTopLeftRight" colspan="2">Dotyczy kuratorów </td>
                </tr>
                <tr>
                    <td align="center" class="col_168 borderTopLeft">dla dorosłych </td>
                    <td align="center" class="col_168 borderTopLeftRight">rodzinnych </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="4">0</td>
                    <td align="center" class="col_168 borderTopLeft">1</td>
                    <td align="center" class="col_168 borderTopLeft">2</td>
                    <td align="center" class="col_168 borderTopLeftRight">3</td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" rowspan="4">Liczba</td>
                    <td class="wciecie borderTopLeft" colspan="2">posiedzeń zespołów interdyscyplinarnych z udziałem kuratorów w okresie statystycznym </td>
                    <td align="center" class="borderTopLeft col_36">01</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w01_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft" rowspan="2">grup roboczych w skład których, wchodzili kuratorzy sądowi </td>
                    <td class="wciecie borderTopLeft col_300">w okresie statystycznym </td>
                    <td align="center" class="borderTopLeft col_36">02</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w02_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft col_300">stan w ostatnim dniu okresu statystycznego </td>
                    <td align="center" class="borderTopLeft col_36">03</td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w03_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w03_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w03_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeftBottom" colspan="2">spotkań grup roboczych z udziałem kuratorów w okresie statystycznym </td>
                    <td align="center" class="borderTopLeftBottom col_36">04</td>
                    <td class="col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w04_c01" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.2!2!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w04_c02" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1.2!3!4')">
                        <asp:Label CssClass="normal" ID="tab_C412_w04_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>

            <br />
        </div>

        <table style="width: 100%;">
            <tr>
                <td colspan="3"><strong>Część V<br />
                    Dział 5.1.</strong> Obciążenia administracyjne respondentóww</td>
            </tr>
            <tr>
                <td class="">&nbsp;</td>
                <td>przygotowanie danych dla potrzeb wypełnianego formularza </td>
                <td class="borderAll col_150">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>wypełnienie formularza </td>
                <td class="borderAll col_150">
                    <asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />

        <div>

            <br />
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp; przez
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>