<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss10r.aspx.cs" Inherits="Statystyki_2018.mss10r"  MaintainScrollPositionOnPostback="true"%>

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
       <div id="menu" style="background-color: #f7f7f7;z-index:9999">
        <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position:relative;  width: 1150px;    left: 0px;">

         <table class="tbl_manu">

        <tr>
            <td style="width:90px;">
                <asp:Label ID="Label4" runat="server" Text="Zakres:"></asp:Label>
                  </td>
              <td style="width:80px;">

                     <dx:aspxdateedit ID="Date1" runat="server" Theme="Moderno" Height="20px">
                </dx:aspxdateedit>
                </td>
              <td style="width:80px;">
                <dx:aspxdateedit ID="Date2" runat="server" Theme="Moderno" AutoResizeWithContainer="True" Height="20px">
                </dx:aspxdateedit>
            </td>
            <td style="width: 100px">
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>

            <td>

                Id. raportu</td>
            <td>

                <asp:TextBox ID="idRaportu" runat="server" ></asp:TextBox>
            </td>
            <td>

                Id. Sądu</td>
            <td>

                <asp:TextBox ID="idSad" runat="server" ></asp:TextBox>
            </td>
            <td>
                 <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
            </td>
        </tr>
    </table>
    </div>
           </div>
      </div>

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" >

    <div id="debag">

        <div class="page-break">

 <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc" colspan="2">Sąd Rejonowy w ..................................<br />
&nbsp;(Zespół Kuratorskiej Służby Sądowej)<br />
                        </td>
                        <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S10r<br />
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
                            <table style="width:100%;">
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
           <strong>
            &nbsp;<br />
           <br />
           Dział 1. </strong> Ewidencja spraw w wykazach wykonawczych

		      <br />
              <br />
                  <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td  class=" center borderTopLeft">Wyszczególnienia</td>
                      <td  class=" center borderTopLeft">L.P.</td>
                      <td  class=" center col_168 borderTopLeft"><strong>POZOSTAŁO</strong><br />
z ubiegłego roku </td>
                      <td  class=" center col_168 borderTopLeft"><strong>WPŁYNĘŁO</strong><br />
razem </td>
                      <td  class=" center col_168 borderTopLeft"><strong>ZAKOŃCZONO</strong><br />razem </td>
                      <td  class=" center col_168 borderTopLeftRight"><strong>POZOSTAŁO</strong><br />na okres następny </td>
                  </tr>
                  <tr>
                      <td  class=" center borderTopLeft" colspan="2">0</td>
                      <td  class=" center col_168 borderTopLeft">1</td>
                      <td  class=" center col_168 borderTopLeft">2</td>
                      <td  class=" center col_168 borderTopLeft">3</td>
                      <td  class=" center col_168 borderTopLeftRight">4</td>
                  </tr>
                  <tr>
                    <td class=" center wciecie borderTopLeft">Ogółem </td>
                      <td  class=" center borderTopLeft col_36">01</td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center wciecie borderTopLeft">Wu</td>
                      <td  class=" center borderTopLeft col_36">02</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center wciecie borderTopLeft">Wo</td>
                      <td  class=" center borderTopLeft col_36">03</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">Wp</td>
                      <td  class=" center borderTopLeft col_36">04</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=4!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=4!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=4!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=4!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">Wpkz</td>
                      <td  class=" center borderTopLeft col_36">05</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=5!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=5!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=5!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=5!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">Wzaw</td>
                      <td  class=" center borderTopLeft col_36">06</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=6!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=6!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=6!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=6!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">D</td>
                      <td  class=" center borderTopLeft col_36">07</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=7!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=7!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=7!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=7!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">Śr. zab.</td>
                      <td  class=" center borderTopLeft col_36">08</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=8!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=8!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=8!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=8!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeft wciecie">NF</td>
                      <td  class=" center borderTopLeft col_36">09</td>
        			<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=9!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=9!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=9!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=9!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class=" center borderTopLeftBottom wciecie">Karty dłużnika</td>
                      <td  class=" center borderTopLeftBottom col_36">10</td>
        			<td class=" center col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=10!1!1!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=10!1!2!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=10!1!3!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class=" center col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=10!1!4!4')">  <asp:Label Cssclass=" center normal" ID="tab_1_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  </table>

		   <br />
              </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 2. </strong>Wykonywanie warunkowego umorzenia postępowania<br />

           <strong>
           Dział 2.1. </strong>Warunkowe umorzenie postępowania
		      <br />
		      <br />
             <br />
             <table cellpadding="0" cellspacing="0" style="width:100%;">
                 <tr>
                     <td class="borderTopLeft" colspan="3" align="center">Warunkowo umorzone postępowania (wykaz Wu) </td>
                     <td class="borderTopLeft" align="center">Sprawy </td>
                     <td class="col_168 borderTopLeftRight">Osoby</td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="3">0</td>
                     <td align="center" class="borderTopLeft col_168">1</td>
                     <td align="center" class="col_168 borderTopLeftRight">2</td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">Wpływ (k. 01 = dz. 1 k. 02 w. 02)</td>
                     <td class="borderTopLeft col_36">01</td>
                     <td class="borderTopLeft col_168"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderAll col_168"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_21_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">w tym przekazane z innego sądu</td>
                     <td class="borderTopLeft col_36">02</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie col_150" rowspan="2">Z liczby ogółem
                         <br />
                         (z w.01) </td>
                     <td class="borderTopLeft wciecie">z nałożonymi obowiązkami, środkami karnymi, środkami kompensacyjnymi lub przepadkiem</td>
                     <td class="borderTopLeft col_36">03</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">bez nałożonych obowiązków, środków karnych, środków kompensacyjnych lub przepadku </td>
                     <td class="borderTopLeft col_36">04</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=4!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft" colspan="2">Zakończono wykonywanie orzeczeń (k.01 w.05=06 do 10 = dz.1 k.03 w.02)</td>
                     <td class="borderTopLeft col_36">05</td>
                     <td class="borderTopLeft col_168"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderAll col_168"><a href="javascript:openPopup('popup.aspx?sesja=5!2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_21_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" rowspan="4">na skutek</td>
                     <td class="borderTopLeft wciecie">upływu okresu próby</td>
                     <td class="borderTopLeft col_36">06</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=6!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <tr>
                     <td class="borderTopLeft wciecie">podjęcia warunkowo umorzonego postępowania </td>
                     <td class="borderTopLeft col_36">07</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=7!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">przekazania innemu sądowi </td>
                     <td class="borderTopLeft col_36">08</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=8!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">umorzenia postępowania wykonawczego </td>
                     <td class="borderTopLeft col_36">09</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=9!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">innych przyczyn </td>
                     <td class="borderTopLeft col_36">10</td>
                     <td class="borderTopLeft col_36">10</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=10!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">Pozostało (stan w ostatnim dniu okresu statystycznego) (k. 01 = dz. 1 k. 04 w. 02) </td>
                     <td class="borderTopLeft col_36">11</td>
                     <td class="borderTopLeft col_168"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderAll col_168"><a href="javascript:openPopup('popup.aspx?sesja=11!2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_21_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">w tym przekazane z innego sądu</td>
                     <td class="borderTopLeft col_36">12</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=12!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeftBottom wciecie" rowspan="2">Z liczby ogółem (z w.11) </td>
                     <td class="borderTopLeft wciecie">z nałożonymi obowiązkami, środkami karnymi, środkami kompensacyjnymi lub przepadkiem</td>
                     <td class="borderTopLeft col_36">13</td>
                     <td class="borderTopLeftRight col_168"><a href="javascript:openPopup('popup.aspx?sesja=13!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeftBottom wciecie">bez nałożonych obowiązków, środków karnych, środków kompensacyjnych lub przepadku</td>
                     <td class="borderTopLeftBottom col_36">14</td>
                     <td class="borderAll col_168"><a href="javascript:openPopup('popup.aspx?sesja=14!2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_21_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
             </table>
             <br />
              <br />
             </div>
        
            


 <asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
        <div class="page-break">

           <strong>
           <br />
           Dział 3 </strong>Wykonywanie kary grzywny

           <strong>
           <br />
           Dział 3.1. </strong>Wykonywanie kary grzywny samoistnej
		      <br />
		      <br />

		<table cellpadding="0" cellspacing="0" style="width:100%;">
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="3" rowspan="2">Orzeczone dozory przy warunkowym umorzeniu postępowania (wykaz D)</td>
                     <td align="center" class="borderTopLeft" colspan="2">Sprawy</td>
                     <td align="center" class="borderTopLeftRight" colspan="2">Osoby</td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft">w związku z przestępstwami</td>
                     <td align="center" class="borderTopLeft">w związku z wykroczeniami </td>
                     <td align="center" class="borderTopLeft">w związku z przestępstwami</td>
                     <td align="center" class="borderTopLeftRight">w związku z wykroczeniami </td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="3">0</td>
                     <td align="center" class="borderTopLeft col_100">1</td>
                     <td align="center" class="borderTopLeft col_100">2</td>
                     <td align="center" class="borderTopLeft col_100">3</td>
                     <td align="center" class="borderTopLeftRight col_100">4</td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">Wpływ (w.01=03+04=05+06)</td>
                     <td class="borderTopLeft col_36">01</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; w tym przekazane z innego sądu</td>
                     <td class="borderTopLeft col_36">02</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" colspan="2">Zakończono (w.04+05)</td>
                     <td class="borderTopLeft col_36">03</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie col_68" rowspan="2">Z powodu</td>
                     <td class="borderTopLeft wciecie">uiszczenia kary grzywny </td>
                     <td class="borderTopLeft col_36">04</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">innych przyczyn </td>
                     <td class="borderTopLeft col_36">05</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeftBottom wciecie col_68" rowspan="3">Pozostało (stan w ostatnim dniu okresu sprawozdawczego)</td>
                     <td class="borderTopLeft wciecie">razem (w.07+08) </td>
                     <td class="borderTopLeft col_36">06</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">wykonywanych </td>
                     <td class="borderTopLeft col_36">07</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeftBottom wciecie">niewykonywanych (zawieszone) </td>
                     <td class="borderTopLeftBottom col_36">08</td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_31_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_31_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_31_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_31_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
            </table>

             <br />
              <br />
             </div>

        <div class="page-break">

            <table style="width:100%;">
                <tr>
                    <td> <strong>Dział. 3.1.a.</strong> Wykonywanie kary grzywny orzeczonej przy zastosowaniu przepisów przejściowych ustawy z dn. 20 lutego 2015 r. (Dz. U. poz. 396) - art. 16 ust. 1 pkt 1 </td>
                    <td class="col_115"><a href="javascript:openPopup('popup.aspx?sesja=1!3.1.a!1!4')">
                        <asp:TextBox ID="tab_31a_w01_c01" runat="server" ReadOnly="True"></asp:TextBox></a>
                    </td>
                </tr>
            </table>

           <strong>
           <br />
           Dział 3.2. </strong>Wykonywanie kary grzywny orzeczonej obok kary z warunkowym zawieszeniem jej wykonania<br />
&nbsp;
                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="4">Orzeczenia kary grzywny orzeczonej obok kary z warunkowym zawieszeniem jej wykonania</td>
                      <td class="borderTopLeft col_100">Sprawy</td>
                      <td class="borderTopLeftRight col_100">Osoby</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="4">0</td>
                      <td class="borderTopLeft col_100">1</td>
                      <td class="borderTopLeftRight col_100">2</td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Wpływ</td>
                      <td class="borderTopLeft col_36">01</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie col_70" colspan="3">&nbsp;&nbsp;&nbsp; w tym przekazane z innego sądu</td>
                      <td class="borderTopLeft col_36">02</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie col_70" colspan="3">Zakończono (w.04+05)</td>
                      <td class="borderTopLeft col_36">03</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="2">z powodu </td>
                      <td class="borderTopLeft wciecie" colspan="2">uiszczenia kary grzywny </td>
                      <td class="borderTopLeft col_36">04</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">innych przyczyn </td>
                      <td class="borderTopLeft col_36">05</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom  wciecie col_68" rowspan="19">Pozostało</td>
                      <td class="borderTopBottom  wciecie" rowspan="3">&nbsp;(stan w ostatnim dniu okresu sprawozdawczego)</td>
                      <td class="borderTopLeft wciecie">razem (w.07+08) </td>
                      <td class="borderTopLeft col_36">06</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">wykonywanych </td>
                      <td class="borderTopLeft col_36">07</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie">niewykonywanych (zawieszone) </td>
                      <td class="borderTopLeftBottom col_36">08</td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.2!1!4')">  <asp:Label CssClass="normal" ID="tab_32_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!3.2!2!4')">  <asp:Label CssClass="normal" ID="tab_32_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
              </table>
		     <br />
		      <br />
              </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 3.3. </strong>Zastępcza kara pozbawienia wolności orzeczona w okresie sprawozdawczym w zamian za nieuiszczoną grzywnę
		      <br />
		      <br />

		<table cellpadding="0" cellspacing="0" style="width:100%;">
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="3" rowspan="3">Orzeczenia zastępczej kary pozbawienia wolności lub zastępczej kary aresztu w zamian za nieuiszczoną grzywnę (wykaz Ko)</td>
                     <td align="center" class="borderTopLeftRight" colspan="4">Z orzecznictwa (w okresie sprawozdawczym) </td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="2">w związku z przestępstwami </td>
                     <td align="center" class="borderTopLeftRight" colspan="2">w związku z wykroczeniami </td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft">Liczba wydanych postanowień </td>
                     <td align="center" class="borderTopLeft">Liczba postanowień, które uprawomocniły się </td>
                     <td align="center" class="borderTopLeft">Liczba wydanych postanowień i</td>
                     <td align="center" class="borderTopLeftRight">Liczba postanowień, które uprawomocniły się </td>
                 </tr>
                 <tr>
                     <td align="center" class="borderTopLeft" colspan="3">0</td>
                     <td align="center" class="borderTopLeft col_100">1</td>
                     <td align="center" class="borderTopLeft col_100">2</td>
                     <td align="center" class="borderTopLeft col_100">3</td>
                     <td align="center" class="borderTopLeftRight col_100">4</td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie" rowspan="2">Liczba orzeczeń w zamian za grzywnę:</td>
                     <td class="borderTopLeft wciecie">orzeczoną obok pozbawienia wolności (aresztu) </td>
                     <td class="borderTopLeft col_36">01</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.3!1!4')">  <asp:Label CssClass="normal" ID="tab_33_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.3!2!4')">  <asp:Label CssClass="normal" ID="tab_33_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.3!3!4')">  <asp:Label CssClass="normal" ID="tab_33_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!3.3!4!4')">  <asp:Label CssClass="normal" ID="tab_33_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeft wciecie">samoistną </td>
                     <td class="borderTopLeft col_36">02</td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.3!1!4')">  <asp:Label CssClass="normal" ID="tab_33_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.3!2!4')">  <asp:Label CssClass="normal" ID="tab_33_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.3!3!4')">  <asp:Label CssClass="normal" ID="tab_33_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!3.3!4!4')">  <asp:Label CssClass="normal" ID="tab_33_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                 <tr>
                     <td class="borderTopLeftBottom  wciecie" colspan="2">Wstrzymanie wykonania zastępczej kary pozbawienia wolności (art. 48a § 1 kkw)</td>
                     <td class="borderTopLeftBottom col_36">03</td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.3!1!4')">  <asp:Label CssClass="normal" ID="tab_33_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.3!2!4')">  <asp:Label CssClass="normal" ID="tab_33_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.3!3!4')">  <asp:Label CssClass="normal" ID="tab_33_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                     <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!3.3!4!4')">  <asp:Label CssClass="normal" ID="tab_33_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
            </table>

             <br />
              <br />
             </div>

        <div class="page-break">
                <strong>
                <br />Dział 4. </strong>Wykonywanie kary ograniczenia wolności i wykonywanie pracy społecznie użytecznej orzekanej w zamian za nieuiszczoną grzywnę<br />
                <strong>Dział 4.1</strong>. Wykonywanie kary ograniczenia wolności<br />
                <br />
                <br />
       <table cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="5" rowspan="3">Orzeczone kary ograniczenia wolności (Wykaz Wo)</td>
                        <td align="center" class="borderTopLeft" colspan="2">Sprawy Wo </td>
                        <td align="center" class="borderTopLeftRight" colspan="2">Osoby</td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="2">W związku z </td>
                        <td align="center" class="borderTopLeftRight" colspan="2">W związku z </td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft">przestępstwami </td>
                        <td class="borderTopLeft">wykroczeniami </td>
                        <td class="borderTopLeft">przestępstwami </td>
                        <td class="borderTopLeft">wykroczeniami </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="5">0</td>
                        <td align="center" class="borderTopLeft col_75">1</td>
                        <td align="center" class="borderTopLeft col_75">2</td>
                        <td align="center" class="borderTopLeft col_75">3</td>
                        <td align="center" class="borderTopLeftRight col_75">4</td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="4">Wpływ (w.01&lt;= w. 03 do 06) </td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="4">w tym przekazane z innego sądu </td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="4">polegająca na</td>
                        <td class="borderTopLeft wciecie" colspan="3">nieodpłatnej kontrolowanej pracy na cele społeczne </td>
                        <td class="borderTopLeft col_36">03</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">obowiązku pozostawania w określonym miejscu z zastosowaniem s.d.e </td>
                        <td class="borderTopLeft col_36">04</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">obowiązkach z art. 72 § 1 pkt 4-7a kk </td>
                        <td class="borderTopLeft col_36">05</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">potrąceniu z wynagrodzenia za pracę </td>
                        <td class="borderTopLeft col_36">06</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="4">Zakończono (w okresie sprawozdawczym) (razem w.07 = w.08 do 17+19+20) </td>
                        <td class="borderTopLeft col_36">07</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="13">z powodu</td>
                        <td class="borderTopLeft wciecie" colspan="3">wykonania orzeczonej nieodpłatnej, kontrolowanej pracy na cel społeczny </td>
                        <td class="borderTopLeft col_36">08</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">zakończenia potrąceń z wynagrodzenia w związku z upływem okresu kary </td>
                        <td class="borderTopLeft col_36">09</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">wykonania obowiązku bądź upływu okresu na jaki obowiązek został nałożony </td>
                        <td class="borderTopLeft col_36">10</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">wykonania obowiązku pozostawania w określonym miejscu z zastosowaniem s.d.e </td>
                        <td class="borderTopLeft col_36">11</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">zwolnienia od reszty kary z powodu uznania jej za wykonaną </td>
                        <td class="borderTopLeft col_36">12</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie col_100" rowspan="3">zamiany na karę zastępczą </td>
                        <td class="borderTopLeft wciecie" rowspan="2">pozbawienia wolności (art. 65 § 1 kkw lub art. 43 zd kkw) </td>
                        <td class="borderTopLeft wciecie">obligatoryjnie </td>
                        <td class="borderTopLeft col_36">13</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">fakultatywnie </td>
                        <td class="borderTopLeft col_36">14</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">aresztu (art. 23 § 1 kw)</td>
                        <td class="borderTopLeft col_36">15</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft" colspan="3">uchylenia zamiany i zarządzenia wykonania kary pozbawienia wolności (art. 75a § 5 kk) </td>
                        <td class="borderTopLeft col_36">16</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie col_100" rowspan="2">umorzenia postępowania wykonawczego </td>
                        <td class="borderTopLeft wciecie" colspan="2">ogółem </td>
                        <td class="borderTopLeft col_36">17</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">w tym z powodu przedawnienia wykonania kary </td>
                        <td class="borderTopLeft col_36">18</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">przekazania innemu sądowi </td>
                        <td class="borderTopLeft col_36">19</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w19_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">innego</td>
                        <td class="borderTopLeft col_36">20</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w20_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="4">Pozostało (wykonywanie i niewykonywane - stan w ostatnim dniu okresu statystycznego) (w.21 = w.22 + w. 27 )</td>
                        <td class="borderTopLeft col_36">21</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w21_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="4">Liczba wykonywanych razem (w.22&lt;= w.23 do 26) - stan w ostatnim dniu okresu sprawozdawczego</td>
                        <td class="borderTopLeft col_36">22</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w22_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="4">z tego</td>
                        <td class="borderTopLeft wciecie" colspan="3">nieodpłatna kontrolowana praca na cele społeczne </td>
                        <td class="borderTopLeft col_36">23</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w23_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">obowiązek pozostawania w określonym miejscu z zastosowaniem s.d.e </td>
                        <td class="borderTopLeft col_36">24</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w24_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w24_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">obowiązki z art. 72 § 1 pkt 4-7a kk </td>
                        <td class="borderTopLeft col_36">25</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w25_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w25_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">potrącenie z wynagrodzenia za pracę </td>
                        <td class="borderTopLeft col_36">26</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w26_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w26_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w26_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w26_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft" colspan="4">Liczba niewykonywanych razem (w.27 &lt;= w.28 do 35) – stan w ostatnim dniu okresu sprawozdawczego </td>
                        <td class="borderTopLeft col_36">27</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w27_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w27_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w27_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w27_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom  wciecie" rowspan="15">z powodu</td>
                        <td class="borderTopLeft wciecie col_100" rowspan="3">odroczenia wykonania w trybie art. </td>
                        <td class="borderTopLeft wciecie" colspan="2">62 § 1 kkw- zbyt ciężkie skutki dla skazanego lub jego rodziny </td>
                        <td class="borderTopLeft col_36">28</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=28!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w28_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=28!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w28_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=28!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w28_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=28!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w28_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">62 § 2 kkw - z powodu powołania skazanego do czynnej służby wojskowej </td>
                        <td class="borderTopLeft col_36">29</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=29!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w29_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=29!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w29_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=29!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w29_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=29!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w29_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">43i § 2 kkw – z powodu braku możliwości niezwłocznego rozpoczęcia wykonywania kary w s.d.e. </td>
                        <td class="borderTopLeft col_36">30</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=30!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w30_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=30!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w30_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=30!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w30_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=30!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w30_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="3">przerwy w&nbsp;wykonaniu udzielonej w&nbsp;trybie art.</td>
                        <td class="borderTopLeft wciecie" colspan="2">63 § 1 kkw - ze względu na stan zdrowia skazanego </td>
                        <td class="borderTopLeft col_36">31</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=31!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w31_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=31!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w31_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=31!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w31_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=31!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w31_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">63 § 2 kkw - ze względu na zbyt ciężkie skutki dla skazanego lub jego rodziny </td>
                        <td class="borderTopLeft col_36">32</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=32!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w32_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=32!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w32_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=32!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w32_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=32!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w32_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">63 § 3 kkw w zw. z art. 62 § 2 kkw - powołanie skazanego do&nbsp;czynnej służby wojskowej </td>
                        <td class="borderTopLeft col_36">33</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=33!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w33_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=33!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w33_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=33!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w33_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=33!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w33_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">zawieszenia postępowania (art.15 § 2 kkw) </td>
                        <td class="borderTopLeft col_36">34</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=34!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w34_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=34!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w34_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=34!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w34_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=34!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w34_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">innego nie wymienionego wyżej (razem w.35 = w.36 do 42) </td>
                        <td class="borderTopLeft col_36">35</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=35!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w35_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=35!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w35_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=35!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w35_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=35!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w35_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie" rowspan="7">w tym z powodu</td>
                        <td class="borderTopLeft wciecie" colspan="2">ukrywania się skazanego </td>
                        <td class="borderTopLeft col_36">36</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=36!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w36_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=36!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w36_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=36!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w36_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=36!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w36_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">uchylania się skazanego od podjęcia pracy </td>
                        <td class="borderTopLeft col_36">37</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=37!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w37_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=37!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w37_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=37!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w37_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=37!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w37_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">choroby skazanego </td>
                        <td class="borderTopLeft col_36">38</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=38!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w38_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=38!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w38_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=38!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w38_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=38!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w38_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">odbywania przez skazanego kary pozbawienia wolności w innej sprawie </td>
                        <td class="borderTopLeft col_36">39</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=39!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w39_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=39!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w39_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=39!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w39_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=39!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w39_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">odbywania przez skazanego kary pozbawienia wolności orzeczonej na podst. art. 37b kk lub 87 § 2 kk (art. 17a § 2 kkw) </td>
                        <td class="borderTopLeft col_36">40</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=40!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w40_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=40!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w40_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=40!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w40_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=40!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w40_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">braku zakładu pracy, w którym praca społecznie użyteczna mogłaby być wykonana </td>
                        <td class="borderTopLeft col_36">41</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=41!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w41_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=41!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w41_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=41!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w41_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=41!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w41_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie" colspan="2">innego </td>
                        <td class="borderTopLeftBottom col_36">42</td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=42!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w42_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=42!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w42_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=42!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w42_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderAll col_75"><a href="javascript:openPopup('popup.aspx?sesja=42!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w42_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                </table>         <br />
                <br />
            </div>

        <div class="page-break">
                <strong>
                <br /> </strong>
                <br />

		        <table style="width:100%;">
                    <tr>
                        <td>
                <strong>
                            Dział 4.1.a </strong>Wpływ kary ograniczenia wolności orzeczonej przy zastosowaniu przepisów przejściowych ustawy z dn. 20 lutego 2015 r. (Dz. U.  poz. 396)
		        </td>
                           </tr>
                          <tr>
                        <td class="wciecie">- art. 16 ust. 1 pkt 2</td>
                        <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!1!4')">
                            <asp:Label CssClass="normal" ID="tab_41a_w01_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                                </tr>
                       <tr>
                         <td class="wciecie">- art. 17 ust. 1 </td>

                        <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!1!4')">
                            <asp:Label CssClass="normal" ID="tab_41a_w02_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                </table>
                <br />
                </div>

        <div class="page-break">
                 <strong>
                            Dział 4.2 </strong>Wykonywanie pracy społecznie użytecznej orzekanej w zamian za nieuiszczoną grzywnę<br />

                <br />

                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="4" rowspan="3">Orzeczone prace społecznie użyteczne w zamian za nieuiszczoną grzywnę (Wykaz Wo, dodatkowe oznaczenie „psu”)</td>
                        <td align="center" class="borderTopLeft" colspan="2">Sprawy Wo (psu)</td>
                        <td align="center" class="borderTopLeftRight" colspan="2">Osoby</td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="2">W związku z </td>
                        <td align="center" class="borderTopLeftRight" colspan="2">W związku z </td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft">przestępstwami </td>
                        <td class="borderTopLeft">wykroczeniami </td>
                        <td class="borderTopLeft">przestępstwami </td>
                        <td class="borderTopLeft">wykroczeniami </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" colspan="4">0</td>
                        <td align="center" class="borderTopLeft col_75">1</td>
                        <td align="center" class="borderTopLeft col_75">2</td>
                        <td align="center" class="borderTopLeft col_75">3</td>
                        <td align="center" class="borderTopLeftRight col_75">4</td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">Wpływ </td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">w tym przekazane z innego sądu </td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">Zakończono (w okresie sprawozdawczym) (razem w.03 = w.04 do 07+09 do 11)</td>
                        <td class="borderTopLeft col_36">03</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=3!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="8">&nbsp;</td>
                        <td class="borderTopLeft wciecie" colspan="2">wykonania orzeczonej pracy społecznie użytecznej (art. 45 § 1 kkw)</td>
                        <td class="borderTopLeft col_36">04</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=4!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="2">zamiany na karę zastępczą </td>
                        <td class="borderTopLeft wciecie">pozbawienia wolności (art. 46 § 1 kkw) </td>
                        <td class="borderTopLeft col_36">05</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=5!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">aresztu</td>
                        <td class="borderTopLeft col_36">06</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=6!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="2">umorzenia postępowania wykonawczego </td>
                        <td class="borderTopLeft wciecie">ogółem </td>
                        <td class="borderTopLeft col_36">07</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=7!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">w tym z powodu przedawnienia wykonania kary </td>
                        <td class="borderTopLeft col_36">08</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=8!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">uiszczenia kwoty pieniężnej (art. 47 § 2 kkw) </td>
                        <td class="borderTopLeft col_36">09</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=9!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">przekazania innemu sądowi </td>
                        <td class="borderTopLeft col_36">10</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=10!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">Inne </td>
                        <td class="borderTopLeft col_36">11</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=11!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">Pozostało (wykonywanie i niewykonywane - stan w ostatnim dniu okresu statystycznego) (w.12 = w.13 + w.14)</td>
                        <td class="borderTopLeft col_36">12</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=12!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">Liczba wykonywanych ogółem - stan w ostatnim dniu okresu sprawozdawczego </td>
                        <td class="borderTopLeft col_36">13</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=13!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="3">Liczba niewykonywanych razem (w.14&lt; =w.15 do 21) – stan w ostatnim dniu okresu sprawozdawczego </td>
                        <td class="borderTopLeft col_36">14</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=14!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie" rowspan="13">z powodu</td>
                        <td class="borderTopLeft wciecie" rowspan="2">odroczenia wykonania w trybie art. </td>
                        <td class="borderTopLeft wciecie">62 § 1 kkw - zbyt ciężkie skutki dla skazanego lub jego rodziny </td>
                        <td class="borderTopLeft col_36">15</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=15!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">62 § 2 kkw - z powodu powołania skazanego do czynnej służby wojskowej </td>
                        <td class="borderTopLeft col_36">16</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=16!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" rowspan="3">przerwy w wykonaniu udzielonej w trybie art. </td>
                        <td class="borderTopLeft wciecie">63 § 1 kkw - ze względu na stan zdrowia skazanego </td>
                        <td class="borderTopLeft col_36">17</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=17!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">63 § 2 kkw - ze względu na zbyt ciężkie skutki dla skazanego lub jego rodziny </td>
                        <td class="borderTopLeft col_36">18</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=18!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">63 § 3 kkw w zw. z art. 62 § 2 kkw - powołanie skazanego do&nbsp;czynnej służby wojskowej </td>
                        <td class="borderTopLeft col_36">19</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=19!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w19_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">zawieszenia postępowania (art.15 § 2 kkw) </td>
                        <td class="borderTopLeft col_36">20</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=20!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w20_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie" colspan="2">z innego powodu niewymienionego wyżej (razem w.21 = w.22 do 27) </td>
                        <td class="borderTopLeft col_36">21</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=21!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w21_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie" rowspan="6">w tym
                            <br />
                            z powodu</td>
                        <td class="borderTopLeft wciecie">ukrywania się skazanego </td>
                        <td class="borderTopLeft col_36">22</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=22!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w22_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">uchylania się skazanego od podjęcia pracy </td>
                        <td class="borderTopLeft col_36">23</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=23!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w23_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">choroby skazanego </td>
                        <td class="borderTopLeft col_36">24</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w24_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=24!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w24_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeft wciecie">odbywania przez skazanego kary pozbawienia wolności w innej sprawie </td>
                        <td class="borderTopLeft col_36">25</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w25_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=25!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w25_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>

                    <tr>
                        <td class="borderTopLeft wciecie">braku zakładu pracy, w którym praca społecznie użyteczna mogłaby być wykonana </td>
                        <td class="borderTopLeft col_36">26</td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w26_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"<a href="javascript:openPopup('popup.aspx?sesja=26!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w26_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeft col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w26_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftRight col_75"><a href="javascript:openPopup('popup.aspx?sesja=26!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w26_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>

                    <tr>
                        <td class="borderTopLeftBottom wciecie">innego </td>
                        <td class="borderTopLeftBottom  col_36">27</td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w27_c01" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w27_c02" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderTopLeftBottom col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w27_c03" runat="server" Text="0"></asp:Label>  </a></td>
                        <td class="borderAll col_75"><a href="javascript:openPopup('popup.aspx?sesja=27!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w27_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    </tr>
                    </table>

                <br />
                </div>

        <div class="page-break">
                 <strong>
                            Dział 5 Wykonywanie kary pozbawienia wolności
                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dział 5.1 </strong>Liczba orzeczeń oraz osób skierowanych do wykonania, w których zawarto rozstrzygnięcie wydane na podstawie art. 62 kk i 77 § 2 kk<br />
&nbsp;<br />
                 <table cellpadding="0" cellspacing="0" class="auto-style2" width="100%">
                     <tr>
                         <td class="borderTopLeft" colspan="2">Wyszczególnienie</td>
                         <td class="borderTopLeft col_200">Liczba orzeczeń (w okresie sprawozdawczym </td>
                         <td class="borderTopLeftRight col_200">Liczba osób (w okresie sprawozdawczym) </td>
                     </tr>
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="2">0</td>
                         <td align="center" class="borderTopLeft col_200">1</td>
                         <td align="center" class="borderTopLeftRight col_200">2</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">Art. 62 kk </td>
                         <td class="borderTopLeft col_36">01</td>
                         <td class="borderTopLeft col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!1!4')">  <asp:Label CssClass="normal" ID="tab_51_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!2!4')">  <asp:Label CssClass="normal" ID="tab_51_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie">Art. 77 § 2 kk </td>
                         <td class="borderTopLeftBottom col_36">02</td>
                         <td class="borderTopLeftBottom col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!1!4')">  <asp:Label CssClass="normal" ID="tab_51_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderAll col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!2!4')">  <asp:Label CssClass="normal" ID="tab_51_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                 </table>

                <br />
                </div>
         <div class="page-break">
                 <strong>
                            Dział 5.2 </strong>Skazani nieosadzeni w aresztach śledczych lub zakładach karnych, przyczyny nieosadzenia<br />

                 <br />
                 <table style="width:100%;" cellpadding="0" cellspacing="0">
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">Wyszczególnienie</td>
                         <td align="center" class="borderTopLeftRight col_200">Liczby</td>
                     </tr>
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">0</td>
                         <td align="center" class="borderTopLeftRight col_200">1</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie" colspan="2">Osoby prawomocnie skazane na karę pozbawienia wolności z wyłączeniem kar zastępczych, nieosadzone w areszcie śledczym lub zakładzie karnym mimo upływu terminu stawiennictwa do odbycia kary - stan w&nbsp;ostatnim dniu okresu sprawozdawczego</td>
                         <td class="borderTopLeft col_36">01</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie" rowspan="11">przyczyny nieosądzenia</td>
                         <td class="borderTopLeft wciecie">razem ( w.02= w.03 do 09+11+12) w.02 &gt;= w.01 </td>
                         <td class="borderTopLeft col_36">02</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">niezgłoszenie się skazanego do odbycia kary pomimo wezwania lub niedoprowadzenie skazanego przez Policję (inny uprawniony organ) - § 377 Regulaminu urzędowania sądów powszechnych </td>
                         <td class="borderTopLeft col_36">03</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">ukrywanie się skazanego i prowadzenie czynności poszukiwawczych przez Policję jeżeli w sprawie nie wydano postanowienia o poszukiwaniu listem gończym lub postanowienie o ENA </td>
                         <td class="borderTopLeft col_36">04</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">ukrywanie się skazanego i prowadzenie czynności poszukiwawczych przez Policję jeżeli w sprawie wydano postanowienie o poszukiwaniu listem gończym lub postanowienie o ENA </td>
                         <td class="borderTopLeft col_36">05</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">brak czynności w sprawie, w tym nieskierowanie orzeczenia do wykonania </td>
                         <td class="borderTopLeft col_36">06</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">brak informacji o doręczeniu korespondencji sądu skazanemu </td>
                         <td class="borderTopLeft col_36">07</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">wstrzymanie wykonania kary – art. 568 kpk </td>
                         <td class="borderTopLeft col_36">08</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">wstrzymanie wykonania orzeczenia – art. 9 § 3 i § 4 kkw </td>
                         <td class="borderTopLeft col_36">09</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">zawieszenie postępowania wykonawczego – art. 15 § 2 kkw z przyczyn określonych w w. 03-05 </td>
                         <td class="borderTopLeft col_36">10</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">zawieszenie postępowania wykonawczego – art. 15 § 2 kkw z innych przyczyn </td>
                         <td class="borderTopLeft col_36">11</td>
                         <td class="borderTopLeftRight col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie">Inne powody</td>
                         <td class="borderTopLeftBottom col_36">12</td>
                         <td class="borderAll col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     </table>

                 <br />
             </div>
        <div class="page-break">
                 <strong>
                            Dział 5.3 </strong>Odroczenie wykonania kary pozbawienia wolności – osoby<br />

                 <br />
                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">Osoby, wobec których orzeczono odroczenie wykonania kary pozbawienia wolności (wykaz Ko) </td>
                         <td class="borderTopLeft col_150">Osoby, wobec których orzeczono odroczenie wykonania kary pozbawienia wolności (wykaz Ko) </td>
                         <td class="borderTopLeftRight col_150">Osoby, wobec których orzeczenie jest wykonywane (stan w ostatnim dniu okresu sprawozdawczego)</td>
                     </tr>
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">0</td>
                         <td class="borderTopLeft col_150">1</td>
                         <td class="borderTopLeftRight col_150">2</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie" colspan="2">Ogółem osoby (w.01=02 do 04)</td>
                         <td class="borderTopLeft col_36">01</td>
                         <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!5.3!1!4')">  <asp:Label CssClass="normal" ID="tab_53_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!5.3!2!4')">  <asp:Label CssClass="normal" ID="tab_53_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie" rowspan="3">Z liczby ogółem (z w.01) orzeczenia wydane w trybie art. </td>
                         <td class="borderTopLeft wciecie">150 § 1 kkw </td>
                         <td class="borderTopLeft col_36">02</td>
                         <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!5.3!1!4')">  <asp:Label CssClass="normal" ID="tab_53_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!5.3!2!4')">  <asp:Label CssClass="normal" ID="tab_53_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">151 § 1 kkw </td>
                         <td class="borderTopLeft col_36">03</td>
                         <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!5.3!1!4')">  <asp:Label CssClass="normal" ID="tab_53_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!5.3!2!4')">  <asp:Label CssClass="normal" ID="tab_53_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie">151 § 2 kkw </td>
                         <td class="borderTopLeftBottom col_36">04</td>
                         <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!5.3!1!4')">  <asp:Label CssClass="normal" ID="tab_53_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!5.3!2!4')">  <asp:Label CssClass="normal" ID="tab_53_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                 </table>

                 <br />
             </div>
        <div class="page-break">
                 <strong>
                            Dział 5.4 </strong>Warunkowe zawieszenie wykonania kary pozbawienia wolności w trybie art. 152 kkw<br />

                 <br />
                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">Warunkowe zawieszenia wykonania kary pozbawienia wolności (wykaz Ko)</td>
                         <td class="borderTopLeft col_150">Orzeczenia</td>
                         <td class="borderTopLeft col_150">Osoby</td>
                     </tr>
                     <tr>
                         <td align="center" class="borderTopLeft" colspan="3">0</td>
                         <td class="borderTopLeft col_150">1</td>
                         <td class="borderTopLeftRight col_150">2</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie" colspan="2">Ogółem osoby (w.01=02 do 04)</td>
                         <td class="borderTopLeft col_36">01</td>
                         <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!5.4!1!4')">  <asp:Label CssClass="normal" ID="tab_54_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!5.4!2!4')">  <asp:Label CssClass="normal" ID="tab_54_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie" rowspan="2">Z liczby ogółem (z w.01) </td>
                         <td class="borderTopLeft wciecie">z nałożonymi obowiązkami, środkami karnymi, środkami kompensacyjnymi lub przepadkiem </td>
                         <td class="borderTopLeft col_36">02</td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!5.4!1!4')">  <asp:Label CssClass="normal" ID="tab_54_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="ajax__tab_xp">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeft wciecie">bez nałożonych obowiązków, środków karnych, środków kompensacyjnych lub przepadku </td>
                         <td class="borderTopLeft col_36">03</td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!5.4!1!4')">  <asp:Label CssClass="normal" ID="tab_54_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="ajax__tab_xp">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie" rowspan="2">Z liczby ogółem (z w.01)</td>
                         <td class="borderTopLeft wciecie">orzeczono oddanie pod dozór </td>
                         <td class="borderTopLeft col_36">04</td>
                         <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!5.4!1!4')">  <asp:Label CssClass="normal" ID="tab_54_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="ajax__tab_xp">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="borderTopLeftBottom wciecie">nie orzeczono o dozorze </td>
                         <td class="borderTopLeftBottom col_36">05</td>
                         <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=5!5.4!1!4')">  <asp:Label CssClass="normal" ID="tab_54_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                         <td class="ajax__tab_xp">&nbsp;</td>
                     </tr>
                 </table>

                 <br />
             </div>

        <div class="page-break">
                 <strong>
                       Dział 6.      </strong>Wykonywanie warunkowego zawieszenia wykonania kary

                 <br />  &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>
    <br />

             </div>

  

        <div class="page-break">

           <strong>
           <br />
           Dział 6.3. </strong>Orzeczenia będące wynikiem działania sądu z urzędu lub rozpoznania wniosku w przedmiocie dozoru oraz obowiązków w okresie próby przy warunkowym zawieszeniu kary
(w okresie sprawozdawczym)<br />
		      <br />
               <table cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="5" rowspan="2">Podjęcia warunkowo umorzonego postępowania (wykaz Wu)</td>
                    <td class="borderTopLeftRight" colspan="3" align="center">Działanie sądu z urzędu/wnioski rozpoznane dotyczące dozoru i obowiązków w okresie próby </td>
                </tr>
                <tr>
                    <td class="borderTopLeft col_100">razem (rubryka 2+3)</td>
                    <td class="borderTopLeft col_100">uwzględnione</td>
                    <td class="borderTopLeftRight col_100">nieuwzględnione</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="5">0</td>
                    <td class="borderTopLeft col_100">1</td>
                    <td class="borderTopLeft col_100">2</td>
                    <td class="borderTopLeftRight col_100">3</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="4">Ogółem (w.2+7+13+19+25+31)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom  wciecie col_50" rowspan="35">&nbsp;</td>
                    <td class="borderTopLeft wciecie col_150" rowspan="5">oddania pod&nbsp;dozór</td>
                    <td class="borderTopLeftBottom wciecie col_50" rowspan="35">&nbsp;</td>
                    <td class="borderTopLeft wciecie">razem (=w.03 do 06) </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">kuratora</td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">prokuratora</td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie col_150" rowspan="6">zwolnienia z&nbsp;dozoru</td>
                    <td class="borderTopLeft wciecie">razem (=w.08 do 12) </td>
                    <td class="borderTopLeft col_36">07</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Kuratora </td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
				</tr>
				                <tr>
                    <td class="borderTopLeft wciecie">prokuratora </td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">skazanego (obrońcę) </td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie col_150" rowspan="6">ustanowienia obowiązków </td>
                    <td class="borderTopLeft wciecie">razem (=w.14 do 18)</td>
                    <td class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">kuratora </td>
                    <td class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">16</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">prokuratora </td>
                    <td class="borderTopLeft col_36">17</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">skazanego (obrońcę) </td>
                    <td class="borderTopLeft col_36">18</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie col_150" rowspan="6">zmiany obowiązków</td>
                    <td class="borderTopLeft wciecie">razem (=w.20 do 24)</td>
                    <td class="borderTopLeft col_36">19</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">20</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=110!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
				</tr>

				                <tr>
                    <td class="borderTopLeft wciecie">kuratora </td>
                    <td class="borderTopLeft col_36">21</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">22</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">prokuratora </td>
                    <td class="borderTopLeft col_36">23</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">skazanego (obrońcę) </td>
                    <td class="borderTopLeft col_36">24</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w24_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie col_150" rowspan="6">uchylenie obowiązków orzeczonych w&nbsp;wyroku (w tym także po&nbsp;ich zmianie w&nbsp;postępowaniu wykonawczym) </td>
                    <td class="borderTopLeft wciecie">razem (=w.25 do 30)</td>
                    <td class="borderTopLeft col_36">25</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w25_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">26</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w26_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w26_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w26_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">kuratora </td>
                    <td class="borderTopLeft col_36">27</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w27_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w27_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=27!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w27_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">28</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w28_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w28_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=28!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w28_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">prokuratora </td>
                    <td class="borderTopLeft col_36">29</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w29_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w29_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=29!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w29_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">skazanego (obrońcę) </td>
                    <td class="borderTopLeft col_36">30</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w30_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w30_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=30!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w30_c03" runat="server" Text="0"></asp:Label>  </a></td>
				</tr>

					                <tr>
                    <td class="borderTopLeftBottom wciecie col_150" rowspan="6">uchylenie obowiązków w postępowaniu wykonawczym </td>
                    <td class="borderTopLeft wciecie">razem (=w.25 do 30)</td>
                    <td class="borderTopLeft col_36">31</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w31_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w31_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=31!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w31_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">działania sądu z urzędu </td>
                    <td class="borderTopLeft col_36">32</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w32_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w32_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=32!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w32_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">kuratora </td>
                    <td class="borderTopLeft col_36">33</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w33_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w33_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=33!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w33_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">inne uprawnione podmioty sprawujące dozór wymienione w art. 73 § 1 kk </td>
                    <td class="borderTopLeft col_36">34</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w34_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w34_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=34!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w34_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">prokuratora </td>
                    <td class="borderTopLeft col_36">35</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=35!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w35_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=35!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w35_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=35!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w35_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">skazanego (obrońcę) </td>
                    <td class="borderTopLeftBottom col_36">36</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=36!6.3!1!4')">  <asp:Label CssClass="normal" ID="tab_63_w36_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=36!6.3!2!4')">  <asp:Label CssClass="normal" ID="tab_63_w36_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=36!6.3!3!4')">  <asp:Label CssClass="normal" ID="tab_63_w36_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                </table>
         <br />
            <br />
             </div>
        <div class="page-break">

           <strong>
           <br />
           Dział 6.4 </strong> Dozór w okresie warunkowego zawieszenia wykonania kary pozbawienia wolności – osoby, przyczyny zakończenia

		      <br />
              <br />
                  <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="3" rowspan="2">Orzeczone dozory przy warunkowym zawieszeniu wykonania kary pozbawienia wolności (wykaz D)</td>
                      <td align="center" class="borderTopLeft" rowspan="2">L.P.</td>
                      <td align="center" class="borderTopLeft col_100" rowspan="2">Sprawy<br />
                          (=k 02+03)<br />
                      </td>
                      <td align="center" class="borderTopLeft col_100" colspan="2">Z tego dozory sprawowane przez </td>
                      <td align="center" class="col_100 borderTopLeftRight" rowspan="2">Osoby</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft col_100">kuratorów </td>
                      <td align="center" class="borderTopLeft col_100">inne podmioty </td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="4">0</td>
                      <td align="center" class="borderTopLeft col_100">1</td>
                      <td align="center" class="borderTopLeft col_100">2</td>
                      <td align="center" class="borderTopLeft col_100">3</td>
                      <td align="center" class="col_100 borderTopLeftRight">4</td>
                  </tr>
                  <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Wpływ (w.01=03+04 = 05+06) </td>
                      <td align="center" class="borderTopLeft col_36">01</td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!6.4!4!4')">  <asp:Label CssClass="normal" ID="tab_64_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="3">w tym przekazane z innych sądów </td>
                      <td align="center" class="borderTopLeft col_36">02</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100" rowspan="5">&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" rowspan="2">Z tego dozory orzeczono (z w.01) </td>
                      <td class="wciecie borderTopLeft" colspan="2">w wyroku </td>
                      <td align="center" class="borderTopLeft col_36">03</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">w okresie próby (art. 74 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">04</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="2">Z tego dozory orzeczono (z w.01) </td>
                      <td class="borderTopLeft wciecie" colspan="2">z obowiązkami probacyjnymi </td>
                      <td align="center" class="borderTopLeft col_36">05</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">bez obowiązków probacyjnych </td>
                      <td align="center" class="borderTopLeft col_36">06</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Zakończono (w okresie sprawozdawczym) (w. 07 = w. 09) </td>
                      <td align="center" class="borderTopLeft col_36">07</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!6.4!4!4')">  <asp:Label CssClass="normal" ID="tab_64_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Z w.07 po pisemnym upomnieniu sądowego kuratora zawodowego (art.&nbsp;75&nbsp;&nbsp;§ 2a kk) </td>
                      <td align="center" class="borderTopLeft col_36">08</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td rowspan="17">&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Przyczyny zakończenia dozorów - razem (w.09 = w.10 do 13+22 do 24) </td>
                      <td align="center" class="borderTopLeft col_36">09</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=9!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft  wciecie" rowspan="15">na skutek</td>
                      <td class="borderTopLeft  wciecie" colspan="2">upływu okresu zawieszenia </td>
                      <td align="center" class="borderTopLeft col_36">10</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=10!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>

                  <tr>
                    <td class="wciecie borderTopLeft" colspan="2">zwolnienia od dozoru (art. 74 § 2 i 2a kk) </td>
                      <td align="center" class="borderTopLeft col_36">11</td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=11!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">przekazania innym sądom </td>
                      <td align="center" class="borderTopLeft col_36">12</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=12!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">zarządzenia wykonania kary (w.13&lt;=w.14) </td>
                      <td align="center" class="borderTopLeft col_36">13</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=13!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="8">na skutek</td>
                      <td class="borderTopLeft wciecie">razem (w.14 = w.15 do 21) </td>
                      <td align="center" class="borderTopLeft col_36">14</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">popełnienia w okresie próby podobnego przestępstwa umyślnego, za które orzeczono prawomocnie karę pozbawienia wolności (art. 75 § 1 kk) </td>
                      <td align="center" class="borderTopLeft col_36">15</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">rażącego naruszenia porządku prawnego poprzez ponowne używanie przemocy lub groźby bezprawnej wobec osoby najbliższej lub innej osoby małoletniej zamieszkujących wspólnie ze sprawcą (art. 75 § 1a kk) </td>
                      <td align="center" class="borderTopLeft col_36">16</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=16!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">popełnienie innego rodzaju przestępstwa niż określonego w&nbsp;art. 75 § 1 kk (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">17</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=17!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">rażącego naruszenia porządku prawnego w inny sposób (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">18</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=18!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">uchylania się od dozoru (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">19</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=19!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">uchylania się od wykonywania nałożonych obowiązków, środków karnych, środków kompensacyjnych lub przepadku (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">20</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=20!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>

                  <tr>
                    <td class="wciecie borderTopLeft">uchylania się od uiszczenia grzywny (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">21</td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=21!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">zamiany na karę ograniczenia wolności albo grzywnę w trybie art. 75a § 1 kk </td>
                      <td align="center" class="borderTopLeft col_36">22</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=22!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">zamiany na karę ograniczenia wolności albo grzywnę w trybie art. 16 ust.1 ustawy z dn. 20 lutego 2015 r. (Dz. U. poz. 396) </td>
                      <td align="center" class="borderTopLeft col_36">23</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=23!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">innego </td>
                      <td align="center" class="borderTopLeft col_36">24</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=24!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w24_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=24!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie" colspan="3">Pozostało (dozory, wykonywane wg stanu w ostatnim dniu okresu sprawozdawczego)</td>
                      <td align="center" class="borderTopLeftBottom col_36">25</td>
        			<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.4!1!4')">  <asp:Label CssClass="normal" ID="tab_64_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.4!2!4')">  <asp:Label CssClass="normal" ID="tab_64_w25_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=25!6.4!3!4')">  <asp:Label CssClass="normal" ID="tab_64_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=25!6.4!4!4')">  <asp:Label CssClass="normal" ID="tab_64_w25_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  </table>

		   <br />
              </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 6.5. </strong>Zarządzenia wykonania kary warunkowo zawieszonej (w okresie sprawozdawczym)<br />
              <br />
                  <table cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="2" rowspan="2">Zarządzenia wykonania kary warunkowo zawieszonej</td>
                      <td align="center" class="borderTopLeft" rowspan="2">L.P.</td>
                      <td align="center" class="borderTopLeftRight" colspan="3">Działanie sądu z urzędu/wnioski w przedmiocie zarządzenia wykonania kary</td>
                  </tr>
                  <tr>
                      <td align="center" class="col_100 borderTopLeft">razem (rubryka 2+3) </td>
                      <td align="center" class="col_100 borderTopLeft">uwzględnione </td>
                      <td align="center" class="col_100 borderTopLeftRight">nieuwzględnione </td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="3">0</td>
                      <td align="center" class="col_100 borderTopLeft">1</td>
                      <td align="center" class="col_100 borderTopLeft">2</td>
                      <td align="center" class="col_100 borderTopLeftRight">3</td>
                  </tr>
                  <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Ogółem sprawy (w.01=02 do 05)</td>
                      <td align="center" class="borderTopLeft col_36">01</td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">Działania sądu z urzędu</td>
                      <td align="center" class="borderTopLeft col_36">02</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft col_60" rowspan="3">Wnioski złożone przez:</td>
                      <td class="wciecie borderTopLeft">kuratora </td>
                      <td align="center" class="borderTopLeft col_36">03</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=3!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">inny uprawniony podmiot sprawujący dozór </td>
                      <td align="center" class="borderTopLeft col_36">04</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=4!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=4!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=4!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">prokuratora </td>
                      <td align="center" class="borderTopLeft col_36">05</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=5!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=5!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=5!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft col_60" rowspan="3">Zarządzenia dotyczące kary:</td>
                      <td class="borderTopLeft wciecie">pozbawienia wolności </td>
                      <td align="center" class="borderTopLeft col_36">06</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=6!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=6!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=6!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">ograniczenia wolności </td>
                      <td align="center" class="borderTopLeft col_36">07</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=7!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=7!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=7!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">grzywny </td>
                      <td align="center" class="borderTopLeft col_36">08</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=8!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=8!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=8!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft col_60" rowspan="10">z przyczyn</td>
                      <td class="borderTopLeft wciecie">razem (w.09 = w.10 do 18) </td>
                      <td align="center" class="borderTopLeft col_36">09</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=9!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=9!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=9!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft  wciecie">popełnienia w okresie próby podobnego przestępstwa umyślnego, za które orzeczono prawomocnie karę pozbawienia wolności (art. 75 § 1 kk) </td>
                      <td align="center" class="borderTopLeftBottom col_36">10</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=10!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=10!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=10!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>

                  <tr>
                    <td class="wciecie borderTopLeft">rażącego naruszenia porządku prawnego poprzez ponowne używanie przemocy lub groźby bezprawnej wobec osoby najbliższej lub innej osoby małoletniej zamieszkujących wspólnie ze sprawcą (art. 75 § 1a kk) </td>
                      <td align="center" class="borderTopLeft col_36">11</td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=11!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=11!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=11!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">popełnienie innego rodzaju przestępstwa niż określonego w&nbsp;art. 75 § 1 kk (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">12</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=12!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=12!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=12!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">rażącego naruszenia porządku prawnego w inny sposób (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">13</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=13!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=13!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=13!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">uchylania się od dozoru (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">14</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=14!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=14!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=14!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">uchylania się od wykonywania nałożonych obowiązków, środków karnych, środków kompensacyjnych lub przepadku (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">15</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=15!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=15!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=15!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">uchylania się od uiszczenia grzywny (art. 75 § 2 kk) </td>
                      <td align="center" class="borderTopLeft col_36">16</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=16!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=16!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=16!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">określonych w art. 75 § 3 kk </td>
                      <td align="center" class="borderTopLeft col_36">17</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=17!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=17!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=17!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">innych </td>
                      <td align="center" class="borderTopLeft col_36">18</td>
        			<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=18!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=18!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=18!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie" colspan="2">Z liczby ogółem (z w.01) po pisemnym upomnieniu sądowego kuratora zawodowego (art. 75 § 2a kk)</td>
                      <td align="center" class="borderTopLeftBottom col_36">19</td>
        			<td class="col_100 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=19!6.5!1!4')">  <asp:Label CssClass="normal" ID="tab_65_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=19!6.5!2!4')">  <asp:Label CssClass="normal" ID="tab_65_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="col_100 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=19!6.5!3!4')">  <asp:Label CssClass="normal" ID="tab_65_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  </table>

		   <br />
              </div>
        <div class="page-break">

           <strong>
           <br />
           Dział 7. </strong>Wykonywanie orzeczeń w przedmiocie środków zabezpieczających<br />

           <strong>
           Dział 7.1. </strong>Orzeczenia na podstawie art. 94 kk i art. 96 kk<br />
              <br />
                  <table cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="3">Orzeczenia o umieszczeniu w zamkniętym zakładzie leczniczym</td>
                      <td align="center" class="borderTopLeft">L.P.</td>
                      <td align="center" class="col_168 borderTopLeftRight">Liczba</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="4">0</td>
                      <td align="center" class="col_168 borderTopLeftRight">1</td>
                  </tr>
                  <tr>
                    <td class="wciecie borderTopLeft" colspan="3">Liczba skierowanych do wykonania orzeczeń o umieszczeniu w zamkniętym zakładzie leczniczym w okresie sprawozdawczym ogółem (w.01=02 + 03)</td>
                      <td align="center" class="borderTopLeft col_36">01</td>
					<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" rowspan="2">wydana na podstawie:</td>
                      <td class="wciecie borderTopLeft" colspan="2">art. 94 kk </td>
                      <td align="center" class="borderTopLeft col_36">02</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">art. 96 kk </td>
                      <td align="center" class="borderTopLeft col_36">03</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Liczba orzeczeń o umieszczeniu w zamkniętym zakładzie leczniczym podlegających wykonaniu w ostatnim dniu okresu sprawozdawczego (w. 04=05 + 06)</td>
                      <td align="center" class="borderTopLeft col_36">04</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" rowspan="2">wydana na podstawie:</td>
                      <td class="wciecie borderTopLeft" colspan="2">art. 94 kk </td>
                      <td align="center" class="borderTopLeft col_36">05</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=5!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2">art. 96 kk </td>
                      <td align="center" class="borderTopLeft col_36">06</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=6!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie" rowspan="8">Stan w ostatnim dniu okresu sprawozdawczego</td>
                      <td class="borderTopLeft wciecie" colspan="2">sprawca umieszczony w zakładzie </td>
                      <td align="center" class="borderTopLeft col_36">07</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=7!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">sprawca nie został umieszczony w zakładzie leczniczym (w. 08=09 + 10) </td>
                      <td align="center" class="borderTopLeft col_36">08</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=8!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="2">z tego (z w.08)</td>
                      <td class="borderTopLeft wciecie">w których stosowane jest tymczasowe aresztowanie </td>
                      <td align="center" class="borderTopLeft col_36">09</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=9!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft  wciecie">nie jest stosowane tymczasowe aresztowanie </td>
                      <td align="center" class="borderTopLeft col_36">10</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=10!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>

                  <tr>
                    <td class="wciecie borderTopLeftBottom" rowspan="4">przyczyny nieumieszczanie sprawcy w&nbsp;zakładzie leczniczym (z w. 08) (suma w.11 do 14 &gt;= w.08)</td>
                    <td class="wciecie borderTopLeft">brak miejsc w zakładzie leczniczym </td>
                      <td align="center" class="borderTopLeft col_36">11</td>
					<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=11!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">oczekiwanie na decyzję komisji psychiatrycznej ds. środków zabezpieczających </td>
                      <td align="center" class="borderTopLeft col_36">12</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=12!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">niedoprowadzenie sprawcy do zakładu (dotyczy orzeczeń na podstawie art. 94 kk) lub niestawiennictwo </td>
                      <td align="center" class="borderTopLeft col_36">13</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=13!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie">inne</td>
                      <td align="center" class="borderTopLeftBottom col_36">14</td>
        			<td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_71_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  </table>

		   <br />
              </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 7.2&nbsp; </strong> Ewidencja spraw w wykazach wykonawczych

		      <br />
              <br />
                  <table cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="2">Orzeczenia o umieszczeniu sprawcy w zakładzie zamkniętym albo o skierowaniu sprawcy na leczenie ambulatoryjne</td>
                      <td align="center" class="borderTopLeft">L.P.</td>
                      <td align="center" class="col_168 borderTopLeftRight">Liczby</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="3">0</td>
                      <td align="center" class="col_168 borderTopLeftRight">1</td>
                  </tr>
                  <tr>
                    <td class="wciecie borderTopLeft" colspan="2">Liczba wyroków, w których orzeczono środek zabezpieczający na podstawie art. 95a § 1 kk skierowany do&nbsp;wykonania w okresie sprawozdawczym (w.01=02 + 03)</td>
                      <td align="center" class="borderTopLeft col_36">01</td>
					<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" rowspan="2">z tego orzeczono </td>
                      <td class="wciecie borderTopLeft">o umieszczeniu w zakładzie zamkniętym </td>
                      <td align="center" class="borderTopLeft col_36">02</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">o skierowaniu na leczenie ambulatoryjne </td>
                      <td align="center" class="borderTopLeft col_36">03</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">Liczba skazanych zwolnionych z zakładu karnego, w wobec których w wyroku orzeczono środek zabezpieczający na podstawie art. 95a § 1 kk w okresie sprawozdawczym (w.05+06 = w.07+08)</td>
                      <td align="center" class="borderTopLeft col_36">04</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="2">z tego (z w.04) </td>
                      <td class="borderTopLeft wciecie">zwolnieni z uwagi na koniec kary </td>
                      <td align="center" class="borderTopLeft col_36">05</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=5!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">warunkowo przedterminowo zwolnieni </td>
                      <td align="center" class="borderTopLeft col_36">06</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=6!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie" rowspan="2">z tego (z w.04) sąd orzekł </td>
                      <td class="borderTopLeft wciecie">o potrzebie stosowania środka </td>
                      <td align="center" class="borderTopLeft col_36">07</td>
        			<td class="col_168 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=7!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie">o braku potrzeby stosowania środka </td>
                      <td align="center" class="borderTopLeftBottom col_36">08</td>
        			<td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!7.2!1!4')">  <asp:Label CssClass="normal" ID="tab_72_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  </table>

		   <br />
              </div>

          <div class="page-break">

           <strong>
           <br />
           Dział 7.3. </strong> Wykonywanie środków zabezpieczających orzeczonych na podstawie art. 93a kk

		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" width="100%">

               <tr>
                   <td class="borderTopLeft " align="center" colspan="2" rowspan="2">Wyszczególnienie</td>
                   <td class="borderTopLeft col_36" align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeft col_68" align="center" rowspan="2">Razem (kol.1&lt;=kol. 2 do kol.6)</td>
                   <td class="borderTopLeftRight" align="center" colspan="5">Rodzaj środka zabezpieczającego</td>
               </tr>

               <tr>
                   <td class="borderTopLeft col_68" align="center">elektroniczna kontrola miejsca pobytu </td>
                   <td class="borderTopLeft col_68" align="center">terapia </td>
                   <td class="borderTopLeft col_68" align="center">terapia uzależnień </td>
                   <td class="borderTopLeft col_68" align="center">pobyt w zakładzie psychiatrycznym </td>
                   <td class="borderTopLeftRight col_68" align="center">nakaz lub zakaz określony w art. 39 pkt 2-3 kk </td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="3">0</td>
                   <td class="borderTopLeft col_68" align="center">1</td>
                   <td class="borderTopLeft col_68" align="center">2</td>
                   <td class="borderTopLeft col_68" align="center">3</td>
                   <td class="borderTopLeft col_68" align="center">4</td>
                   <td class="borderTopLeft col_68" align="center">5</td>
                   <td class="borderTopLeftRight col_68" align="center">6</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center" colspan="2">Liczba sprawców, wobec których skierowano do wykonania środek zabezpieczający w okresie sprawozdawczym (w.01 &lt;= w. 02 do 06)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center" rowspan="5">sprawcy (art. 93c kk)</td>
                   <td class="wciecie borderTopLeft " align="center">co do których umorzono postępowanie o czyn zabroniony popełniony w stanie niepoczytalności określonej w art. 31 § 1 kk </td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">skazani za przestępstwo popełnione w stanie ograniczonej poczytalności określonej w art. 31 § 2 kk </td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>

			      <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani za przestępstwo określone w art. 148 kk, art. 156 kk, art. 197 kk, art. 198 kk, art. 199 § 2 kk lub art. 200 § 1 kk, popełnione w związku z zaburzeniem preferencji seksualnych </td>
                   <td class="borderTopLeft col_36">04</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>

			  <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani na karę pozbawienia wolności bez warunkowego jej zawieszenia za umyślne przestępstwo określone w rozdziale XIX, XXIII, XXV lub XXVI kk, popełnione w związku z zaburzeniem osobowości o takim charakterze lub nasileniu, że zachodzi co najmniej wysokie prawdopodobieństwo popełnienia czynu zabronionego z użyciem przemocy lub groźbą jej użycia </td>
                   <td class="borderTopLeft col_36">05</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=5!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
             <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani za przestępstwo popełnione w związku z uzależnieniem od alkoholu, środka odurzającego lub innego podobnie działającego środka </td>
                   <td class="borderTopLeft col_36">06</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=6!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                   <td class="wciecie borderTopLeft" align="center" colspan="2">Liczba sprawców w stosunku do których środki podlegają wykonaniu (stan w ostatnim dniu okresu sprawozdawczego) (w.07 &lt;= w. 08 do 12)</td>
                   <td class="borderTopLeft col_36">07</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=7!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                   <td class="wciecie borderTopLeft" align="center" rowspan="5">sprawcy (art. 93c kk)</td>
                   <td class="wciecie borderTopLeft " align="center">co do których umorzono postępowanie o czyn zabroniony popełniony w stanie niepoczytalności określonej w art. 31 § 1 kk </td>
                   <td class="borderTopLeft col_36">08</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=8!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>

			    <tr>
                   <td class="wciecie borderTopLeft " align="center">skazani za przestępstwo popełnione w stanie ograniczonej poczytalności określonej w art. 31 § 2 kk </td>
                   <td class="borderTopLeft col_36">09</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=9!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
			    <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani za przestępstwo określone w art. 148 kk, art. 156 kk, art. 197 kk, art. 198 kk, art. 199 § 2 kk lub art. 200 § 1 kk, popełnione w związku z zaburzeniem preferencji seksualnych </td>
                   <td class="borderTopLeft col_36">10</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=10!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w10_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                   <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani na karę pozbawienia wolności bez warunkowego jej zawieszenia za umyślne przestępstwo określone w rozdziale XIX, XXIII, XXV lub XXVI kk, popełnione w związku z zaburzeniem osobowości o takim charakterze lub nasileniu, że zachodzi co najmniej wysokie prawdopodobieństwo popełnienia czynu zabronionego z użyciem przemocy lub groźbą jej użycia </td>
                   <td class="borderTopLeft col_36">11</td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=11!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w11_c06" runat="server" Text="0"></asp:Label>  </a></td>
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani za przestępstwo popełnione w związku z uzależnieniem od alkoholu, środka odurzającego lub innego podobnie działającego środka </td>
                   <td class="borderTopLeft col_36">12</td>
                   <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=12!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w12_c06" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center" colspan="2">w tym, wobec których środki nie są wykonywane (stan w ostatnim dniu okresu sprawozdawczego) (w.13 &lt;= w. 14 do 18) </td>
                   <td class="borderTopLeft col_36">13</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=13!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w13_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>

			      <tr>
                   <td class="wciecie borderTopLeftBottom" align="center" rowspan="5">sprawcy (art. 93c kk)</td>
                   <td class="wciecie borderTopLeft " align="center">co do których umorzono postępowanie o czyn zabroniony popełniony w stanie niepoczytalności określonej w art. 31 § 1 kk </td>
                   <td class="borderTopLeft col_36">14</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=14!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w14_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>

			  <tr>
                   <td class="wciecie borderTopLeft " align="center">skazani za przestępstwo popełnione w stanie ograniczonej poczytalności określonej w art. 31 § 2 kk </td>
                   <td class="borderTopLeft col_36">15</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=15!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w15_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
             <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani za przestępstwo określone w art. 148 kk, art. 156 kk, art. 197 kk, art. 198 kk, art. 199 § 2 kk lub art. 200 § 1 kk, popełnione w związku z zaburzeniem preferencji seksualnych </td>
                   <td class="borderTopLeft col_36">16</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=16!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w16_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                   <td class="wciecie borderTopLeft" align="center">skazani na karę pozbawienia wolności bez warunkowego jej zawieszenia za umyślne przestępstwo określone w rozdziale XIX, XXIII, XXV lub XXVI kk, popełnione w związku z zaburzeniem osobowości o takim charakterze lub nasileniu, że zachodzi co najmniej wysokie prawdopodobieństwo popełnienia czynu zabronionego z użyciem przemocy lub groźbą jej użycia </td>
                   <td class="borderTopLeft col_36">17</td>
                <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_68"><a href="javascript:openPopup('popup.aspx?sesja=17!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w17_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                   <td class="wciecie borderTopLeftBottom" align="center">skazani za przestępstwo popełnione w związku z uzależnieniem od alkoholu, środka odurzającego lub innego podobnie działającego środka </td>
                   <td class="borderTopLeftBottom col_36">18</td>
                <td class="borderTopLeftBottom col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!1!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!2!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!3!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!4!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!5!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_68"><a href="javascript:openPopup('popup.aspx?sesja=18!7.3!6!4')">  <asp:Label CssClass="normal" ID="tab_73_w18_c06" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               </table>
       </div>
        <div class="page-break">

           <strong>
           <br />
           Dział 8 </strong>Zawieszenie postępowania wykonawczego w trybie art. 15 § 2 kkw<br />
		      <br />
               <table cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Zawieszenia postępowania wykonawczego co do osób (wykaz Ko)</td>
                    <td class="borderTopLeft col_150">Liczba osób (w okresie sprawozdawczym) </td>
                    <td class="borderTopLeftRight col_150">Wykonywane (osoby) (stan w ostatnim dniu okresu sprawozdawczego) </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeft col_150">1</td>
                    <td class="borderTopLeftRight col_150">2</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Ogółem (w. 01=02 do 04)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!8!1!4')">  <asp:Label CssClass="normal" ID="tab_8_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!4')">  <asp:Label CssClass="normal" ID="tab_8_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="3">Z liczby ogółem (z w.01) z powodu</td>
                    <td class="borderTopLeft wciecie">poszukiwanie listem gończym lub ENA </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!8!1!4')">  <asp:Label CssClass="normal" ID="tab_8_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!8!2!4')">  <asp:Label CssClass="normal" ID="tab_8_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeft wciecie">stan zdrowia skazanego </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!8!1!4')">  <asp:Label CssClass="normal" ID="tab_8_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!8!2!4')">  <asp:Label CssClass="normal" ID="tab_8_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">inne przyczyny </td>
                    <td class="borderTopLeftBottom col_36">04</td>
                   <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!8!1!4')">  <asp:Label CssClass="normal" ID="tab_8_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!8!2!4')">  <asp:Label CssClass="normal" ID="tab_8_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                </table>
         <br />
            <br />
             </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 9 </strong>Umorzenie postępowania wykonawczego w trybie art. 15 § 1 kkw<br />
		      <br />
               <table cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Umorzenia postępowania wykonawczego co do osób (wykaz Ko)</td>
                    <td class="borderTopLeftRight col_150">Liczba osób (w okresie sprawozdawczym) </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeftRight col_150">1</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Ogółem (w. 01=02 do 04)</td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!9!1!4')">  <asp:Label CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="3">Z liczby ogółem (z w.01) z powodu</td>
                    <td class="borderTopLeft wciecie">przedawnienie wykonania kary </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!9!1!4')">  <asp:Label CssClass="normal" ID="tab_9_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeft wciecie">śmierć skazanego </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!9!1!4')">  <asp:Label CssClass="normal" ID="tab_9_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">inne przyczyny </td>
                    <td class="borderTopLeftBottom col_36">04</td>
                   <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!9!1!4')">  <asp:Label CssClass="normal" ID="tab_9_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                </table>
         <br />
            <br />
             </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 10. </strong>Orzeczenia będące wynikiem działania sądu z urzędu lub rozpoznania wniosku w przedmiocie dozoru oraz obowiązków w okresie próby przy warunkowym zawieszeniu kary
(w okresie sprawozdawczym)<br />
		      <br />
               <table cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3" rowspan="2">Wyszczególnienie</td>
                    <td class="borderTopLeft" align="center">Wpływ</td>
                    <td class="borderTopLeft" align="center">Zakończone</td>
                    <td class="borderTopLeftRight" align="center" rowspan="2">Wykonywane (stan w ostatnim dniu okresu sprawozdawczego)</td>
                </tr>
                <tr>
                    <td class="borderTopLeft" align="center" colspan="2">(w okresie sprawozdawczym) </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeft col_100">1</td>
                    <td class="borderTopLeft col_100">2</td>
                    <td class="borderTopLeftRight col_100">3</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Ogółem liczba osób (w. 01 &lt;= w. 02 do 06) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Kara ograniczenia wolności - obowiązek pozostawania w określonym miejscu (art. 34 § 1a pkt 2 kk) </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="2">Środek karny - zakaz zbliżania się do określonych osób </td>
                    <td class="borderTopLeft wciecie">fakultatywny – art. 41a § 1 kk </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">obligatoryjny – art. 41a § 2 kk </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Środek karny – zakaz wstępu na imprezę masową (art. 41b § 3 kk) </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" colspan="2">Środek zabezpieczający – elektroniczna kontrola miejsca pobytu (art. 93a § 1 pkt 1 kk) </td>
                    <td class="borderTopLeftBottom col_36">06</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!10!2!4')">  <asp:Label CssClass="normal" ID="tab_10_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!10!3!4')">  <asp:Label CssClass="normal" ID="tab_10_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>                </tr>
                </table>
         <br />
            <br />
             </div>

        <div class="page-break">

           <strong>
           <br />
           Dział 11. </strong>Wykonywanie środka karnego w postaci zakazu prowadzenia pojazdów <br />
		      <br />
               <table cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">Środki karne </td>
                    <td class="borderTopLeft col_150">Wpływ (w okresie sprawozdawczym) </td>
                    <td class="borderTopLeftRight col_150">Wykonywane (stan w ostatnim dniu okresu sprawozdawczego) </td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="3">0</td>
                    <td class="borderTopLeft col_150">1</td>
                    <td class="borderTopLeftRight col_150">2</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">Zakaz prowadzenia pojazdów - ogółem (w. 01=02 + 03) </td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie" rowspan="2">z tego w związku z </td>
                    <td class="borderTopLeft wciecie">przestępstwami </td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeft wciecie">wykroczeniami </td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeft wciecie" colspan="2">w tym z wiersza 01 zakazu prowadzenia pojazdów niewyposażonych w blokadę alkoholową (w. 04=05 + 06) </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie" rowspan="2">z tego w związku z </td>
                    <td class="borderTopLeft wciecie">przestępstwami </td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_150"><a href="javascript:openPopup('popup.aspx?sesja=5!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_150"><a href="javascript:openPopup('popup.aspx?sesja=5!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="borderTopLeftBottom wciecie">wykroczeniami </td>
                    <td class="borderTopLeftBottom col_36">06</td>
                    <td class="borderTopLeftBottom col_150"><a href="javascript:openPopup('popup.aspx?sesja=6!11!1!4')">  <asp:Label CssClass="normal" ID="tab_11_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll  col_150"><a href="javascript:openPopup('popup.aspx?sesja=6!11!2!4')">  <asp:Label CssClass="normal" ID="tab_11_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                </table>
         <br />
            <br />
             </div>
          &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>
    <br />

      
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

    <br />
  </div>
</asp:Content>