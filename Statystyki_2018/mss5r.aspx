<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss5r.aspx.cs" Inherits="Statystyki_2018.mss5r" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    1.<style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }
    </style><script src="Scripts/rls.js"></script><div class="noprint">
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

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative; left: 0px; display:block">

    <div id="tabela1"  style="z-index:10; visibility:hidden;">
  <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
<asp:Label ID="Label6" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
   </div>

  &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
  ConnectionString="<%$ ConnectionStrings:wap %>"

  SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
  <SelectParameters>
<asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
  </SelectParameters>
 </asp:SqlDataSource>
     </div>

     <div id="Div2"  style="z-index:10; ">
   <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
 <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div>

   <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                    </tr>
                    <tr>
                        <td class="borderAll col_33prc" colspan="2">Sąd Rejonowy w ..................................<br />
                            &nbsp;<br />
                        </td>
                        <td class="borderAll col_33prc center" rowspan="2"><strong><span class="auto-style1">MS-S5r<br />
                            </span></strong>
                            <br />
                            <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                            <br />
                            w sprawach karnych i wykroczeniowych</td>
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
                            za … kwartał …**) 20… r.</td>
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

        <div id='1.1'>
            <strong>Dział 1.1.</strong>&nbsp; Ewidencja spraw

    <table>
  <tr>
    <td  class="borderAll center" colspan="4">SPRAWY wg repertoriów lub wykazów</td>
    <td  class="col_100 center borderAll ">Pozostało z ubiegłego roku </td>
    <td  class="col_100 center borderAll ">WPŁYNĘŁO razem </td>
    <td  class="col_100 center borderAll ">ZAŁATWIONO </td>
    <td  class="col_100 center borderAll ">Pozostało na okres następny </td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="4">0</td>
    <td  class="col_100 center borderAll ">1</td>
    <td  class="col_100 center borderAll ">2</td>
    <td  class="col_100 center borderAll ">3</td>
    <td  class="col_100 center borderAll ">4</td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">OGÓŁEM (suma wierszy 02,59,78,80)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Sprawy karne ogółem (suma wierszy 03, 10, 36)</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="7">K</td>
    <td  class="borderAll wciecie" colspan="2">razem (wiersze 4 do 9) p)</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="3">z oskarżenia </td>
    <td  class="borderAll wciecie" style="wciecie borderAll">publicznego </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="wciecie borderAll">prywatnego</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w05_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" style="wciecie borderAll">tryb art. 55 § 1 kpk </td>
    <td  class="borderAll col_36">6</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w06_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">wyrok łączny </td>
        <td  class="borderAll col_36">7</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w07_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">sprawy o przestępstwa z kodeksu karnego skarbowego</td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w08_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
  <td  class="borderAll wciecie" colspan="2">odpowiedzialność podmiotów zbiorowych</td>
      <td  class="borderAll col_36">9</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w09_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Kp (suma wierszy od 11 do 34)</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w10_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2" rowspan="2">Tymczasowe aresztowanie w toku śledztwa lub dochodzenia (art. 250 kpk)</td>
    <td  class="borderAll wciecie" style="wciecie borderAll">zastosowanie</td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w11_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="wciecie borderAll">przedłużenie</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w12_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zastosowanie aresztowania jako kary porządkowej w toku postępowania przygotowawczego ( do 30 dni) na wniosek prokuratora wobec osób uporczywie uchylających się od złożenia zeznania, wykonania czynności biegłego, tłumacza oraz wydania przedmiotów (art. 287 § 2 i 290 kpk)</td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w13_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="6">Rozpoznawanie</td>
    <td  class="borderAll wciecie" colspan="2">zażaleń na zatrzymanie osoby (art. 246 kpk) </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w14_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zażaleń na odmowę wszczęcia dochodzenia lub śledztwa oraz na umorzenie postępowania przygotowawczego (art. 306 §1 kpk)</td>
        <td  class="borderAll col_36">15</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w15_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wniosków prokuratora o skierowanie podejrzanego na badanie psychiatryczne połączone z obserwacją psychiatryczną w zakładzie zamkniętym oraz o przedłużenie tej obserwacji (art. 203 kpk)</td>
        <td  class="borderAll col_36">16</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w16_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zażaleń na postanowienia prokuratora w przedmiocie zastosowania innych niż tymczasowe aresztowanie środków zapobiegawczych (art. 252 §2 kpk)</td>
        <td  class="borderAll col_36">17</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w17_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zażaleń na postanowienia dot. zabezpieczenia majątkowego na mieniu oskarżonego (art. 293 kpk)</td>  <td  class="borderAll col_36">18</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w18_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zażalenia oskarżonego na postanowienie prokuratora w sprawie zachowania w tajemnicy danych osobowych świadka (art. 184 §5 kpk)</td>
        <td  class="borderAll col_36">19</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w19_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zarządzenia - na wniosek prokuratora – kontroli i utrwalenia treści rozmów telefonicznych (art. 237 §1 kpk) oraz zatwierdzenia postanowień prokuratora w tym przedmiocie, wydanych w sytuacjach niecierpiących zwłoki (art. 237 §2 kpk), a także rozpoznawania zażaleń na postanowienia prokuratora w zakresie kontroli i utrwalania tych rozmów (art. 240 kpk) </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w20_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="3">Rozpoznawanie wniosków</td>
    <td  class="col_100 borderAll " rowspan="2">prokuratora</td>
    <td  class="borderAll wciecie">dotyczących orzeczenia o przepadku przedmiotu poręczenia majątkowego (art. 270 §1 kpk)</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w21_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">o orzeczenie przepadku przedmiotów tytułem środka zabezpieczającego – po prawomocnym umorzeniu dochodzenia lub śledztwa (art. 323 §3 kpk)</td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w22_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">organów postępowania przygotowawczego o orzeczenie przepadku przedmiotów tytułem środka zabezpieczającego w oparciu o przepisy Kodeksu karnego skarbowego</td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w23_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w23_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="3">Przesłuchania – na żądanie strony, prokuratora lub innego organu prowadzącego postępowanie – świadka w sytuacji, gdy zachodzi obawa niemożności przesłuchania go na rozprawie – (art. 316§3 kpk)</td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w24_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w24_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="4">Rozpoznawanie wniosków prokuratora</td>
    <td  class="borderAll wciecie" colspan="2">i podejrzanego o wyznaczenie obrońcy z urzędu oraz wniosków stron i innych osób uprawnionych o wyznaczenie pełnomocnika z urzędu (art. 78 §1 i art. 88 kpk)</td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w25_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w25_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">o przedłużenie nakazu opuszczania lokalu mieszkalnego zajmowanego wspólnie z pokrzywdzonym na dalsze okresy (art.275a §1 i 4 kpk) </td>
        <td  class="borderAll col_36">26</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w26_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w26_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">o udzielenie informacji stanowiących tajemnicę bankową [art. 106b ustawy z dnia 29 sierpnia 1997 r. - Prawo bankowe (Dz. U. z 2015 r. poz. 128, z późn. zm.)] </td>
        <td  class="borderAll col_36">27</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w27_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w27_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">o przesłuchanie osoby poniżej 15 lat w trybie art. 185a kpk. i 185b kpk (patrz dział 1.1.7.a) </td>
        <td  class="borderAll col_36">28</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w28_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w28_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">O nadanie klauzuli wykonalności</td>
  <td  class="borderAll col_36">29</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w29_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w29_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w29_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w29_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
     <td  class="borderAll wciecie" colspan="3">Wniosek o zwolnienie z obowiązku zachowania tajemnicy zawodowej </td>
   <td  class="borderAll col_36">30</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w30_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w30_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w30_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w30_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
      <td  class="borderAll wciecie" colspan="3">Zażalenie na postanowienie o zwolnieniu z obowiązku zachowania tajemnicy związanej z pełnioną funkcją </td>
   <td  class="borderAll col_36">31</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w31_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w31_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w31_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w31_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zażalenie na zatrzymanie prawa jazdy </td>
    <td  class="borderAll col_36">32</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w32_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w32_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w32_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w32_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zażalenie na postanowienia dotyczące przeszukania i zatrzymania rzeczy (art. 236 kpk) </td>
    <td  class="borderAll col_36">33</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w33_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w33_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w33_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w33_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Inne </td>
    <td  class="borderAll col_36">34</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w34_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w34_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w34_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w34_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Ko (suma wierszy 36 , 59) </td>
    <td  class="borderAll col_36">35</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w35_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w35_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w35_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w35_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
        <td  class="borderAll wciecie" colspan="3">Ko - sprawy karne (suma wierszy od 37 do 58) </td>
    <td  class="borderAll col_36">36</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w36_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w36_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w36_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w36_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
        <td  class="borderAll wciecie" colspan="3">Udzielenie pomocy sądowej </td>
    <td  class="borderAll col_36">37</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w37_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w37_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w37_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w37_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
      <td  class="borderAll wciecie" colspan="3">Skrócenie wykonania środka karnego </td>
  <td  class="borderAll col_36">38</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w38_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w38_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w38_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w38_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
      <td  class="borderAll wciecie" colspan="3">Zatarcie skazania </td>
   <td  class="borderAll col_36">39</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w39_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w39_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w39_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w39_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Podjęcie warunkowo umorzonego postępowania </td>
    <td  class="borderAll col_36">40</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w40_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w40_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w40_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w40_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zarządzenie wykonania kary warunkowo zawieszonej </td>
    <td  class="borderAll col_36">41</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w41_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w41_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w41_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w41_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Odroczenie i odwołanie odroczenia wykonania kary </td>
    <td  class="borderAll col_36">42</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w42_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w42_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w42_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w42_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Prośby o ułaskawienie </td>
    <td  class="borderAll col_36">43</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w43_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w43_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w43_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w43_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Odtworzenie akt sprawy </td>
    <td  class="borderAll col_36">44</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w44_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w44_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w44_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w44_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wnioski o przyjęcie do depozytu sądowego (art.231§1 kpk) </td>
  <td  class="borderAll col_36">45</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w45_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w45_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w45_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w45_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Umorzenie, odroczenie, odwołanie odroczenia, rozłożenie na raty, odwołanie rozłożenia na raty kary grzywny lub kosztów sądowych </td>
  <td  class="borderAll col_36">46</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w46_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w46_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w46_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w46_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Zarządzenie wykonania zastępczej kary pozbawienia wolności lub pracy społecznie użytecznej </td>
    <td  class="borderAll col_36">47</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w47_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w47_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w47_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w47_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Warunkowe zawieszenie wykonania kary pozbawienia wolności, której uprzednio wykonanie odroczono </td>
    <td  class="borderAll col_36">48</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w48_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w48_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w48_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w48_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Przekazanie sprawy do rozpoznania innemu sądowi (z wyłączeniem art. 35 kpk) </td>
        <td  class="borderAll col_36">49</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w49_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w49_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w49_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w49_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wyłączenie sędziego, jeżeli wniosek przekazano z innego sądu lub wydziału </td>
  <td  class="borderAll col_36">50</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w50_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w50_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w50_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w50_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski dotyczące dozorów (wnioski o oddanie pod dozór wnioski o zwolnienie od dozoru) </td>
    <td  class="borderAll col_36">51</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w51_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w51_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w51_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w51_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski dotyczące zmiany uchylenia lub ustanowienia obowiązku nałożonego na skazanego </td>
    <td  class="borderAll col_36">52</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w52_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w52_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w52_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w52_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zwolnienie z reszty kary ograniczenia wolności </td>
        <td  class="borderAll col_36">53</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w53_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w53_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w53_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w53_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Uznanie za wykonane środków karnych po upływie połowy okresu, na który je orzeczono </td>
        <td  class="borderAll col_36">54</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w54_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w54_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w54_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w54_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zamiany kary ograniczenia wolności na zastępczą karę pozbawienia wolności (orzeczenie wykonania zastępczej kary pozbawienia wolności w miejsce kary ograniczenia wolności (art. 65 § 1 kkw) </td>
        <td  class="borderAll col_36">55</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w55_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w55_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w55_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w55_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski złożone na podstawie art.398-401 ustawy z dnia 12 grudnia 2013 r. o cudzoziemcach (Dz. U. z 2013 r. poz. 1650, z późn. zm.) </td>
     <td  class="borderAll col_36">56</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w56_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w56_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w56_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w56_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
  <td  class="borderAll wciecie" colspan="3">Orzeczenia wydane na podstawie art. 201 i 204 kkw </td>
        <td  class="borderAll col_36">57</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w57_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w57_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w57_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w57_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Inne </td>
    <td  class="borderAll col_36">58</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w58_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w58_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w58_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w58_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Ko - sprawy wykroczeniowe (suma wierszy od 60 do 77) </td>
    <td  class="borderAll col_36">59</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w59_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w59_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w59_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w59_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski o uchylenie mandatu</td>
        <td  class="borderAll col_36">60</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=60!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w60_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=60!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w60_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=60!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w60_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=60!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w60_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Pisma i czynności dotyczące zatrzymanych praw jazdy </td>
        <td  class="borderAll col_36">61</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=61!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w61_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=61!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w61_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=61!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w61_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=61!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w61_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zażalenia na zatrzymanie </td>
    <td  class="borderAll col_36">62</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=62!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w62_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=62!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w62_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=62!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w62_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=62!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w62_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski o zabezpieczenie zajętego przedmiotu (art. 48 k.p.w.) </td>
    <td  class="borderAll col_36">63</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=63!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w63_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=63!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w63_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=63!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w63_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=63!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w63_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Udzielenie pomocy sądowej </td>

    <td  class="borderAll col_36">64</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=64!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w64_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=64!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w64_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=64!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w64_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=64!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w64_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Skrócenie wykonania środka karnego </td>
      <td  class="borderAll col_36">65</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=65!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w65_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=65!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w65_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=65!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w65_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=65!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w65_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zatarcie ukarania </td>
      <td  class="borderAll col_36">66</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=66!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w66_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=66!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w66_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=66!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w66_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=66!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w66_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zarządzenie wykonania kary aresztu warunkowo zawieszonej </td>
      <td  class="borderAll col_36">67</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=67!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w67_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=67!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w67_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=67!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w67_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=67!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w67_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Odroczenie i odwołanie odroczenia wykonania kary </td>
      <td  class="borderAll col_36">68</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=68!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w68_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=68!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w68_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=68!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w68_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=68!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w68_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Prośby o ułaskawienie </td>
      <td  class="borderAll col_36">69</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=69!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w69_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=69!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w69_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=69!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w69_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=69!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w69_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Odtworzenie akt sprawy </td>
      <td  class="borderAll col_36">70</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=70!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w70_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=70!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w70_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=70!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w70_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=70!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w70_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski o przyjęcie do depozytu sądowego (art.231§1 kpk) </td>
      <td  class="borderAll col_36">71</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=71!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w71_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=71!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w71_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=71!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w71_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=71!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w71_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Umorzenie, odroczenie, odwołanie odroczenia, rozłożenie na raty, odwołanie rozłożenia na raty, grzywny i należności sądowych </td>
      <td  class="borderAll col_36">72</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=72!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w72_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=72!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w72_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=72!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w72_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=72!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w72_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Zarządzenie wykonania zastępczej kary aresztu </td>
      <td  class="borderAll col_36">73</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=73!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w73_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=73!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w73_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=73!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w73_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=73!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w73_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Przekazanie sprawy do rozpoznania innemu sądowi </td>
      <td  class="borderAll col_36">74</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=74!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w74_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=74!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w74_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=74!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w74_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=74!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w74_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wyłączenie sędziego </td>
    <td  class="borderAll col_36">75</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=75!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w75_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=75!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w75_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=75!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w75_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=75!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w75_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Wnioski złożone na podstawie art. 401 ust. 2 ustawy z dnia 12 grudnia 2013 r. o cudzoziemcach (Dz. U. z 2013 r. poz. 1650, z późn. zm.) </td>
  <td  class="borderAll col_36">76</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=76!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w76_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=76!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w76_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=76!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w76_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=76!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w76_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Inne </td>
  <td  class="borderAll col_36">77</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=77!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w77_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=77!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w77_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=77!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w77_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=77!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w77_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">W</td>
  <td  class="borderAll col_36">78</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=78!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w78_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=78!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w78_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=78!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w78_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=78!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w78_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">W tym wykroczenia skarbowe </td>
  <td  class="borderAll col_36">79</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=79!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w79_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=79!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w79_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=79!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w79_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=79!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w79_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="3">Kop (suma wierszy od 81 do 95) </td>
  <td  class="borderAll col_36">80</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=80!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w80_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=80!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w80_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=80!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w80_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=80!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w80_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="14"></td>
    <td  class="col_100 borderAll " rowspan="2">Ministra Sprawiedliwości o zaopiniowanie </td>
    <td  class="borderAll wciecie">prawnej dopuszczalności przejęcia prawomocnego orzeczenia do wykonania w Rzeczypospolitej Polskiej (art. 608 § 2 kpk i art. 609 § 2 kpk.) </td>
  <td  class="borderAll col_36">81</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=81!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w81_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=81!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w81_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=81!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w81_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=81!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w81_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">przekazania prawomocnego orzeczenia do wykonania za granicą (art. 610 § 5 kpk) </td>
  <td  class="borderAll col_36">82</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=82!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w82_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=82!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w82_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=82!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w82_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=82!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w82_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">państw obcych o wykonanie prawomocnych orzeczeń o </td>
    <td  class="borderAll wciecie">zabezpieczenie mienia (art. 611d § 2 kpk) </td>
  <td  class="borderAll col_36">83</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=83!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w83_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=83!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w83_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=83!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w83_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=83!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w83_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">karach o charakterze pieniężnym </td>
  <td  class="borderAll col_36">84</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=84!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w84_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=84!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w84_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=84!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w84_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=84!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w84_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2" style="borderAll wciecie">kierowane za pośrednictwem Ministra Sprawiedliwości o wydanie przez państwo obce osoby, przeciwko której wszczęto postępowanie karne, o wydanie osoby w celu przeprowadzenia postępowania sądowego lub wykonania orzeczonej kary pozbawienia wolności, o przewóz osoby ściganej lub skazanej przez terytorium państwa obcego oraz o wydanie z terytorium państwa obcego dowodów rzeczowych lub przedmiotów uzyskanych przez sprawcę w wyniku przestępstwa (art. 593 kpk)</td>
  <td  class="borderAll col_36">85</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=85!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w85_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=85!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w85_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=85!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w85_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=85!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w85_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="5">do państw członkowskich Unii Europejskiej o wykonanie </td>
    <td  class="borderAll wciecie">postanowienia o zatrzymaniu dowodów lub mającego na celu zabezpieczenie mienia (art. 589g-589k kpk) </td>
  <td  class="borderAll col_36">86</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=86!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w86_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=86!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w86_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=86!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w86_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=86!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w86_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">środka zapobiegawczego (art. 607zd-607zg kpk) </td>
  <td  class="borderAll col_36">87</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=87!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w87_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=87!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w87_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=87!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w87_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=87!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w87_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia dotyczącego grzywny, środków karnych w postaci nawiązki lub świadczenia pieniężnego lub też orzeczenia zasądzającego od sprawcy koszty procesu (611fa-611fe kpk) </td>
  <td  class="borderAll col_36">88</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=88!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w88_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=88!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w88_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=88!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w88_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=88!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w88_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia przepadku (art.611fn-611 ft kpk) </td>
  <td  class="borderAll col_36">89</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=89!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w89_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=89!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w89_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=89!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w89_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=89!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w89_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia skazującego na karę pozbawienia wolności z warunkowym zawieszeniem jej wykonania, karę ograniczenia wolności, samoistnie orzeczony środek karny, a także orzeczenia o warunkowym zwolnieniu oraz warunkowym umorzeniu postępowania karnego (art. 611u-611uc kpk) </td>
  <td  class="borderAll col_36">90</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=90!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w90_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=90!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w90_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=90!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w90_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=90!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w90_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="4">państw członkowskich Unii Europejskiej o wykonanie </td>
    <td  class="borderAll wciecie">postanowienia o zatrzymaniu dowodów lub mającego na celu zabezpieczenie mienia (art. 589l-589u kpk) </td>
  <td  class="borderAll col_36">91</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=91!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w91_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=91!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w91_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=91!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w91_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=91!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w91_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia o karach o charakterze pieniężnym (art. 611ff-611fm kpk) </td>
  <td  class="borderAll col_36">92</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=92!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w92_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=92!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w92_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=92!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w92_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=92!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w92_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia przepadku (art. 611fu-611 fze) </td>
  <td  class="borderAll col_36">93</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=93!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w93_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=93!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w93_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=93!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w93_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=93!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w93_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">orzeczenia karnego związanego z poddaniem sprawcy próbie (art. 611ud-611uj kpk) </td>
  <td  class="borderAll col_36">94</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=94!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w94_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=94!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w94_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=94!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w94_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=94!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w94_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Inne</td>
  <td  class="borderAll col_36">95</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=95!1.1!1!4')"><asp:Label CssClass="normal" ID="tab_11_w95_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=95!1.1!2!4')"><asp:Label CssClass="normal" ID="tab_11_w95_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=95!1.1!3!4')"><asp:Label CssClass="normal" ID="tab_11_w95_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=95!1.1!4!4')"><asp:Label CssClass="normal" ID="tab_11_w95_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

       <div>

           <table style="width:100%;">
   <tr>
 <td class="col_115">

     <strong>Dział 1.1.a.</strong></td>
 <td c>sprawy rep. K skierowane na posiedzenie w trybie art. 339 § 4 kpk w okresie sprawozdawczym celem rozważenia przekazania do postępowania mediacyjnego </td>
       <td class="col_200">     <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!1!4')"> <asp:TextBox ID="tab_11a_w01_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
   </tr>
  <td class="col_115">
    </td>
 <td >sprawy rep. K skierowane do postępowania mediacyjnego w wyniku posiedzenia w trybie art. 339 § 4 kpk </td>
       <td class="col_200">     <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!1!4')"> <asp:TextBox ID="tab_11a_w02_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
   </tr>
     </table>
       </div>

  &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
    <br />

        <div id='1.1.2'>
            <br />
<strong>Dział 1.1.2.</strong>&nbsp;Struktura załatwień spraw
            <br />
    <table>
  <tr>
    <td  class="center borderAll" colspan="5" rowspan="2">Wyszczególnienie </td>
    <td  class="center borderAll" rowspan="2">Ogółem</td>
    <td  class="center borderAll" colspan="2">w tym</td>
  </tr>
  <tr>
    <td  class="center borderAll">Załatwienie K </td>
    <td  class="center borderAll">Załatwienie W</td>
  </tr>
  <tr>
    <td  class="center borderAll" colspan="5">0</td>
    <td  class="center borderAll">1</td>
    <td  class="center borderAll">2</td>
    <td  class="center borderAll">3</td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Ogółem ( wiersz 01 = w. 02 do 04 + 07 do 30) </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Zwrot w trybie art. 337kpk / 59 § 1 kpw (brak uzupełnienia w terminie bądź ponowne przesłanie nie uzupełnionego) </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Zwrot sprawy w trybie art. 343 § 7 zd. 1 kpk </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Wyrok łączny </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">w tym załatwiono poprzez przekazanie w trybie art. 35 kpk </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">w tym załatwiono w wyniku umorzenia postępowania </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="6">Przekazano w trybie </td>
    <td  class="borderAll wciecie" colspan="3">art. 35 kpk (z wyłączeniem wyroków łącznych) </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2" colspan="2">art. 36 kpk </td>
    <td  class="borderAll wciecie" style="width: 250px">w ramach okręgu </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="width: 150px">poza okręg</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="3">art. 37 kpk (art. 11 §2 upw) </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="3">art. 11a pwkpk </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="3">art. 25 § 2 kpk </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Zwrot w trybie art. 345 i 344a kpk </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w13_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">W wyniku zmian Zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. Nr 5, poz.22 z późn. zm.) </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w14_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">W wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w15_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">W wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w16_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="4">Zmiany organizacyjne związane z </td>
    <td  class="col_100 borderAll " rowspan="2" colspan="2">Utworzeniem </td>
    <td  class="borderAll wciecie" style="width: 150px">wydziału (ów) </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w17_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="width: 150px">sądu (ów) </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w18_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2" colspan="2">Likwidacją&nbsp; </td>
    <td  class="borderAll wciecie" style="width: 150px">wydziału (ów) </td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w19_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="width: 150px">sądu (ów) </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w20_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3" rowspan="2">w wyniku zmiany obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie" style="width: 150px">wydziału (ów) </td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w21_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" style="width: 150px">sądu (ów) </td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w22_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="4" class="wciecie borderAll">Załatwienie w wyniku przekazania w trybie 5art. 43 kpk </td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w23_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="4" class="wciecie borderAll">Załatwienie w wyniku przekazania w trybie 5art. 44 kpk </td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w24_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="4" class="wciecie borderAll">Zakreślono wobec nie uzupełnienia braków czy wniesienia opłaty w terminie (z oskarżenia prywatnego) </td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w25_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="4" class="wciecie borderAll">Zakreślenie omyłkowych wpisów </td>
  <td  class="borderAll col_36">26</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w26_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="4">Odmowa wszczęcia postępowania w sprawach o wykroczenia </td>
  <td  class="borderAll col_36">27</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w27_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="4" class="wciecie borderAll">Wyrok nakazowy </td>
  <td  class="borderAll col_36">28</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w28_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="2" class="wciecie borderAll" rowspan="2">Zakreśl spraw </td>
    <td colspan="2" class="wciecie borderAll">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">29</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w29_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w29_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w29_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="2" class="wciecie borderAll">w związku ze wspólnym wpływem § 77 ust.2 Regulaminu</td>
  <td  class="borderAll col_36">30</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w30_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w30_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w30_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
         <tr>
    <td colspan="4" class="wciecie borderAll">Inne formalne </td>
  <td  class="borderAll col_36">31</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w31_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w31_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w31_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
          <tr>
    <td colspan="4" class="wciecie borderAll">Załatwienie pozostałych spraw </td>
  <td  class="borderAll col_36">32</td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w32_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w32_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_100 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w32_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

   <div id="zalatwienia"  class="page-break">
       <br />
    <br />

  <strong>Dział 1.1.b </strong> <asp:Label ID="tabela1Label" runat="server"></asp:Label>

 <br />
 <table cellpadding="0" cellspacing="0" style="width:100%;">
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3" rowspan="3" class="center">Wyszczególnienie spraw
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" rowspan="3" class="col_90 center borderAll">Wyznaczono orzeczenia</td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="8" class="borderAll center">podstawa prawna art.</td>
     </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_190" colspan="2">335 kpk</td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_90 center borderAll" rowspan="2">336 kpk
 <br />
 (wniosek prokuratora)</td>
   <td  style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll" rowspan="2">warunkowe umorzenie z urzędu (bez wniosku prokuratora w trybie 336)</td>
   <td  style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll" rowspan="2">338a kpk</td>
   <td  style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll" rowspan="2">387 kpk (oskarżonego) </td>
   <td  style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll" rowspan="2">474a kpk (oskarżonego)</td>
   <td  style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_90 center borderAll" rowspan="2">335 i 338a kpk*</td>
     </tr>
     <tr>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">§ 1</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">§ 2</td>
     </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_246" colspan="3">0</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">1</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">2</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">3</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">4</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">5</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">6</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">7</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll">8</td>
   <td  style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; " class="col_90 center borderAll">9</td>
     </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " colspan="2">Wnioski złożone wobec osób lub przez osoby (k.1=k.2 do 4 + 6 do 8)</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_29">01</td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!1!4')">  <asp:Label ID="tab_11b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!2!4')">  <asp:Label ID="tab_11b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!3!4')">  <asp:Label ID="tab_11b_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!4!4')">  <asp:Label ID="tab_11b_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll">  <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!5!4')">  <asp:Label ID="tab_11b_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll">  <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!6!4')">  <asp:Label ID="tab_11b_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll">  <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!7!4')">  <asp:Label ID="tab_11b_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll">  <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!8!4')">  <asp:Label ID="tab_11b_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!9!4')">  <asp:Label ID="tab_11b_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label></a>
</td>
     </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px thin thin;" class="col_190" rowspan="3">Orzeczenia <br />
 sądu</td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " class="col_190"><strong>na posiedzeniu <br />
 </strong>(k. 1 = 2 do 9) </td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_29">02</td>
    <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!1!4')">  <asp:Label ID="tab_11b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
    <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!2!4')">  <asp:Label ID="tab_11b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!3!4')">  <asp:Label ID="tab_11b_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!4!4')">  <asp:Label ID="tab_11b_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!5!4')">  <asp:Label ID="tab_11b_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!6!4')">  <asp:Label ID="tab_11b_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!7!4')">  <asp:Label ID="tab_11b_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px 0px thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!8!4')">  <asp:Label ID="tab_11b_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!9!4')">  <asp:Label ID="tab_11b_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label></a>
</td> </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " class="col_190"><strong>na rozprawie<br />
 </strong>&nbsp;(kol. 1 odpowiada kol 5+7+9) </td>
   <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_29">03</td>
 <td  style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!1!4')">  <asp:Label ID="tab_11b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
    <td  style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!2!4')">  <asp:Label ID="tab_11b_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!3!4')">  <asp:Label ID="tab_11b_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!4!4')">  <asp:Label ID="tab_11b_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px thin thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!5!4')">  <asp:Label ID="tab_11b_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px thin thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!6!4')">  <asp:Label ID="tab_11b_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px thin thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!7!4')">  <asp:Label ID="tab_11b_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-style: solid; border-color: #666666; border-width: thin 0px thin thin;" class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!8!4')">  <asp:Label ID="tab_11b_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin;" class="col_90 center borderAll"> <a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!9!4')">  <asp:Label ID="tab_11b_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label></a>
</td> </tr>
     <tr>
   <td  style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin 0px thin thin;" class="col_190"><strong>razem na posiedzeniu i na rozprawie<br />
 </strong>&nbsp;(w.4= w.2+3) </td>
   <td  style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; " class="col_29">04</td>
 <td  style="border-style: solid; border-width: thin; border-color: #666666; " class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.b!1!4')">  <asp:Label ID="tab_11b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label></a></td>
  </tr>
     </table>
 <br />
 <p class="auto-style4" style="mso-line-height-rule: exactly">
     <span style="font-size:8.0pt">* w przypadku gdy w jednej sprawie zostały złożone wnioski zarówno przez prokuratora (art. 335 kpk) i oskarżonego (art. 338a kpk), należy wykazać je odpowiednio w wierszu 1, w kol. 2,3 i 6. Orzeczenia, które zapadły w wyniku wpływu tych wniosków należy wykazać w wierszu 02 lub 03 jedynie w kol. 9.<span style="mso-spacerun:yes">&nbsp; </span></span><span style="font-size:9.0pt"><o:p></o:p></span>
 </p>
    <br />
 </div>
    <div id="wyznaczenia"  class="page-break">
  <br />
<strong>Dział 1.1.c.</strong> Wyroki nakazowe w okresie sprawozdawczym
  <br />
  <table style="width:100%;">
<tr>
    <td  class="col_29">
    </td>
    <td colspan="2" > Wydano wyroków nakazowych</td>
    <td valign="bottom" align="right">
<a href="javascript:openPopup('popup.aspx?sesja=1!1.1.c!1!4')"> <asp:TextBox ID="tab_11c_w01_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
   </td>
</tr>
<tr>
    <td  class="col_29">
        &nbsp;</td>
    <td colspan="2">
  Liczba sprzeciwów w sprawach nakazowych z rep. K - ogółem</td>
    <td valign="bottom" align="right">
    <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.c!1!4')"> <asp:TextBox ID="tab_11c_w02_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
    </td>
</tr>
<tr>
    <td  class="col_29">
        &nbsp;</td>
    <td class="col_36">
        &nbsp;</td>
    <td>
  w tym przez oskarżyciela</td>
    <td valign="bottom" align="right">
 <a href="javascript:openPopup('popup.aspx?sesja=3!1.1.c!1!4')"> <asp:TextBox ID="tab_11c_w03_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
    </td>
</tr>
<tr>
    <td>
  </td>
    <td  colspan="2">
  Liczba spraw w których wniesiono sprzeciwy</td>
    <td valign="bottom" align="right">
<a href="javascript:openPopup('popup.aspx?sesja=4!1.1.c!1!4')"> <asp:TextBox ID="tab_11c_w04_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
    </td>
</tr>
<tr>
    <td  class="col_29">
        &nbsp;</td>
    <td colspan="2">
  Z załatwień w dz. 1.1. (w.04 k.3) liczba prawomocnych wyroków nakazowych (w okresie sprawozdawczym)</td>
    <td valign="bottom" align="right">
<a href="javascript:openPopup('popup.aspx?sesja=5!1.1.c!1!4')"> <asp:TextBox ID="tab_11c_w05_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
    </td>
</tr>
  </table>
  <br />
  </div>

    <br />
    <div id="Div11"  class="page-break">

<strong>Dział 1.1.d.</strong>&nbsp; Liczba spraw z rep. K załatwionych w związku z postępowaniem mediacyjnym (proszę podać liczbę spraw, w których postępowanie zakończyło się ugodą lub w inny sposób)

  <table cellpadding="0" cellspacing="0" style="width:100%;">
<tr>
    <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">Wyszczególnienie</td>
    <td  class="borderAll center col_150">Razem<br />
    </td>
    <td  class="borderAll center col_150">Ugoda</td>
    <td  class="borderAll center col_150">Brak ugody</td>
    <td  class="borderAll center col_150">Liczba</td>
</tr>
<tr>
    <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="">0</td>
    <td align="center" class="borderAll center col_150">1</td>
    <td align="center" class="borderAll center col_150">2</td>
    <td align="center" class="borderAll center col_150">3</td>
    <td align="center" class="borderAll center col_150">4</td>
</tr>
<tr>
    <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_500"><strong>OGÓŁEM</strong> (wiersze 02 do 03) </td>
    <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_29">01</td>
    <td align="center" class="borderAll center col_150"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_11d_w01_col01" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_11d_w01_col02" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_11d_w01_col03" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150" rowspan="3"><div style="height:99px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
</tr>
<tr>
    <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_500">Prowadzonego przez instytucje</td>
    <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_29">02</td>
    <td class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_11d_w02_col01" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_11d_w02_col02" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_11d_w02_col03" runat="server" Text="0"></asp:Label></a></td>
</tr>
<tr>
    <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_500">Prowadzonego przez osoby godne zaufania</td>
    <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_29">03</td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_11d_w03_col01" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_11d_w03_col02" runat="server" Text="0"></asp:Label></a></td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_11d_w03_col03" runat="server" Text="0"></asp:Label></a></td>
</tr>
<tr>
    <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_500">Liczba mediacji wpisanych w okresie statystycznym do Wykazu Med</td>
    <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_29">04</td>
    <td align="center" class="borderAll center col_150"><div style="height :33px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><div style="height :33px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><div style="height :33px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.d!4!4')"><asp:Label CssClass="normal" ID="tab_11d_w04_col04" runat="server" Text="0"></asp:Label></a></td>
</tr>
<tr>
    <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_500">Liczba zakończonych postępowań mediacyjnych (zakreślonych pozycji w wykazie mediacji bez względu na przyczynę zakreślenia)</td>
    <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">05</td>
    <td align="center" class="borderAll center col_150"><div style="height : 66px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><div style="height :66px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><div style="height :66px" class="strikediag2"> &nbsp;&nbsp; </div> </td>
    <td align="center" class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.d!4!4')"><asp:Label CssClass="normal" ID="tab_11d_w05_col04" runat="server" Text="0"></asp:Label></a></td>
</tr>
  </table>

        Uwaga: Liczba spraw wpisanych do Wykazu Med oraz liczba zakończonych postępowań mediacyjnych dotyczy wszystkich spraw z okresu statystycznego a nie tylko spraw z rep. K załatwionych w związku z postępowaniem mediacyjnym.

  <br />
  <br />

    &nbsp;&nbsp;<br /><strong>Dział 1.1.d.a</strong>. Wyszczególnienie warunków ugody<br />
<table cellpadding="0" cellspacing="0">
    <tr>
  <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_325">Wyszczególnienie</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; " class="col_123">Liczba rodzajów form</td>
    </tr>
    <tr>
  <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246">0</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">1</td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Zadośćuczynienie lub odszkodowanie (finansowe) dla pokrzywdzonego</td>
  <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_29">01</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w01_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Świadczenie pieniężne na cele społeczne</td>
  <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">02</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w02_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Przeproszenie pokrzywdzonego</td>
  <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">03</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w03_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Wykonanie pracy na rzecz pokrzywdzonegoPrzeproszenie pokrzywdzonego</td>
  <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">04</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w04_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Wykonanie pracy na cele społeczne</td>
  <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">05</td>
  <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w05_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
    <tr>
  <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Inne</td>
  <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_29">06</td>
  <td align="center" style="border-style: solid; border-width: thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.d.a!1!4')">
<asp:Label CssClass="normal" ID="tab_11da_w06_c01" runat="server" Text="0"></asp:Label>
</a></td>
    </tr>
</table>
<br />
<br />
  </div>

 <div id="Div11e"  class="page-break">

&nbsp;<table cellpadding="0" cellspacing="0" style="border-width: thin; border-color: #999999">
   <tr>
 <td class="col_100 " style="border-width: thin; border-color: #999999">
     <strong>Dział 1.1.e</strong></td>
 <td rowspan="2" style="border-width: thin; border-color: #999999">W tym wpływ spraw z kodeksu karnego skarbowego z wnioskiem finansowego organu postępowania przygotowawczego o udzielenie zezwolenia na dobrowolne poddanie się odpowiedzialności. (dz.1.1 kol. 2)</td>
 <td class="col_200" style="border: thin solid #666666;">przestępstw (w. 08)</td>
 <td class="col_36" style="border: thin solid #000000;">01</td>
 <td class="col_200" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_11e_w01_c01" runat="server" Text="0"></asp:Label></a></td>
   </tr>
   <tr>
 <td class="col_100" style="border-width: thin; border-color: #999999">&nbsp;</td>
 <td class="col_200" style="border: thin solid #666666;">wykroczeń (w. 79)</td>
 <td class="col_36" style="border: thin solid #000000;">02</td>
 <td class="col_200" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_11e_w02_c01" runat="server" Text="0"></asp:Label></a></td>
   </tr>
     </table>

<br />
</div>

 <div id="Div11f"  class="page-break">
  <table cellpadding="0" cellspacing="0" style="border-width: thin; border-color: #999999">
   <tr>
 <td class="col_100" style="border-width: thin; border-color: #999999">
     &nbsp;</td>
 <td rowspan="5" style="border-width: thin; border-color: #999999">W tym wpływ spraw z kodeksu karnego skarbowego z wnioskiem finansowego organu postępowania przygotowawczego o udzielenie zezwolenia na dobrowolne poddanie się odpowiedzialności. (dz.1.1 kol. 2)</td>
 <td class="borderAll col_90 wciecie" style="border: thin solid #666666;" colspan="3">wyszczególnienie</td>
 <td class="borderAll col_90" style="border: thin solid #000000;">wpływ</td>
 <td class="borderAll col_90" style="border: thin solid #000000;">załatwienie</td>
   </tr>
   <tr>
 <td class="col_100" style="border-width: thin; border-color: #999999">
     <strong>Dział 1.1.f</strong></td>
 <td class="borderAll col_200" style="border: thin solid #666666;" rowspan="3">Z wyłączeniem kks</td>
 <td class="borderAll col_200" style="border: thin solid #666666;">wniesiono o ukaranie bez przeprowadzenia rozprawy (art.58§1 k.p.w.)</td>
 <td class="borderAll col_36" style="border: thin solid #000000;">01</td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_11f_w01_c01" runat="server" Text="0"></asp:Label></a></td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_11f_w01_c02" runat="server" Text="0"></asp:Label></a></td>
   </tr>
   <tr>
 <td class="col_100" style="border-width: thin; border-color: #999999" rowspan="3">&nbsp;</td>
 <td class="borderAll col_200" style="border: thin solid #666666;">złożony na rozprawie (art.58§3 k.p.w.)</td>
 <td class="borderAll col_36" style="border: thin solid #000000;">02</td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_11f_w02_c01" runat="server" Text="0"></asp:Label></a></td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_11f_w02_c02" runat="server" Text="0"></asp:Label></a></td>
   </tr>
   <tr>
 <td class="borderAll col_200" style="border: thin solid #666666;">złożony na rozprawie (art.73 k.p.w.)</td>
 <td class="borderAll col_36" style="border: thin solid #000000;">03</td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_11f_w03_c01" runat="server" Text="0"></asp:Label></a></td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_11f_w03_c02" runat="server" Text="0"></asp:Label></a></td>
   </tr>
   <tr>
 <td class="borderAll wciecie" style="border: thin solid #666666;" colspan="2">Z kodeksu karnego skarbowego</td>
 <td class="borderAll col_36" style="border: thin solid #000000;">04</td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_11f_w04_c01" runat="server" Text="0"></asp:Label></a></td>
 <td class="borderAll col_90" style="border: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_11f_w04_c02" runat="server" Text="0"></asp:Label></a></td>
   </tr>
     </table>

<br />
</div>
    <div id="wyznaczenia"  class="page-break">
  <br />

  <table style="width:100%;">
<tr>
    <td>
<strong>Dział 1.1.g.</strong> Prawomocne wyroki nakazowe w sprawach z rep.W</td>
    <td>

        &nbsp;</td>
    <td valign="bottom" align="right">
<a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!1!4')"> <asp:TextBox ID="tab_11g_w01_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
   </td>
</tr>
</table>
  <br />
  </div>
   &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder02"></asp:PlaceHolder>

 <div id="Div11k"  class="page-break">

     <table style="width:100%;">
   <tr>
 <td class="col_115">

     <strong>Dział 1.1.k.</strong></td>
 <td colspan="6">Wpływ spraw, w których postępowanie przygotowawcze zostało zakończone w formie</td>
   </tr>
   <tr>
 <td class="col_115">&nbsp;</td>
 <td>&nbsp;</td>
 <td class="col_200">śledztwa</td>
 <td class="col_200">     <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!1!4')"> <asp:TextBox ID="tab_11k_w01_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
 <td class="col_200">dochodzenia</td>
 <td class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!2!4')"> <asp:TextBox ID="tab_11k_w01_c02" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
 <td class="col_200">&nbsp;</td>
   </tr>
   <tr>
 <td class="col_115">&nbsp;</td>
 <td colspan="5">Załatwienie spraw, w których postępowanie przygotowawcze zostało zakończone w formie:</td>
 <td>&nbsp;</td>
   </tr>
   <tr>
 <td class="col_115">&nbsp;</td>
 <td>&nbsp;</td>
 <td class="col_200">śledztwa</td>
 <td class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!1!4')"> <asp:TextBox ID="tab_11k_w02_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
 <td class="col_200">dochodzenia</td>
 <td class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!2!4')"> <asp:TextBox ID="tab_11k_w02_c02" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a></td>
 <td class="col_200">&nbsp;</td>
   </tr>
     </table>
     <br />

<br />
     <table style="width:100%;">
   <tr>
 <td class="col_115"><strong>Dział 1.1.l.</strong></td>
 <td colspan="6">W tym uwzględnione wnioski prokuratora o skierowanie podejrzanego na badanie psychiatryczne połączone z obserwacją psychiatryczna w zakładzie zamkniętym oraz o przedłużenie tej obserwacji (art. 203 kpk)</td>
 <td class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!1!4')">
     <asp:TextBox ID="tab_11l_w01_c01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox>
     </a></td>
   </tr>
     </table>
     <br />
     <br />
     <table style="width:100%;" cellpadding="0" cellspacing="0">
   <tr>
 <td class="col_115" rowspan="2"><strong>Dział 1.1.m.</strong></td>
 <td class="col_115" rowspan="2" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;">W tym uwzględnione </td>
 <td style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666" class="wciecie">zamiana kary grzywny na pracę społecznie użyteczną  (art. 45 §1 kkw)</td>
 <td class="col_36" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000">01</td>
 <td class="col_200" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000; border-right-style: solid;"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.m!1!4')">
     <asp:Label CssClass="normal" ID="tab_11m_w01_c01" runat="server" Text="0"></asp:Label>
     </a></td>
   </tr>
   <tr>
 <td style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;" class="wciecie">orzeczenie wykonania zastępczej kary pozbawienia wolności w miejsce kary grzywny (art. 46 §1 kkw)</td>
 <td class="col_36" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000; border-bottom-style: solid;">02</td>
 <td class="col_200" style="border-style: solid; border-width: thin; border-color: #000000"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.m!1!4')">
     <asp:Label CssClass="normal" ID="tab_11m_w02_c01" runat="server" Text="0"></asp:Label>
     </a></td>
   </tr>
     </table>
     <br />
     <table style="width:100%;" cellpadding="0" cellspacing="0">
   <tr>
 <td class="col_115" rowspan="2"><strong>Dział 1.1.n.</strong></td>
 <td class="col_115" rowspan="2" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;">W tym uwzględnione </td>
 <td style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666" class="wciecie">wnioski o oddanie pod dozór</td>
 <td class="col_36" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000">01</td>
 <td class="col_200" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000; border-right-style: solid;"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.n!1!4')">
     <asp:Label CssClass="normal" ID="tab_11n_w01_c01" runat="server" Text="0"></asp:Label>
     </a></td>
   </tr>
   <tr>
 <td style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;" class="wciecie">wnioski o zwolnienie od dozoru</td>
 <td class="col_36" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #000000; border-bottom-style: solid;">02</td>
 <td class="col_200" style="border-style: solid; border-width: thin; border-color: #000000"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.n!1!4')">
     <asp:Label CssClass="normal" ID="tab_11n_w02_c01" runat="server" Text="0"></asp:Label>
     </a></td>
   </tr>
     </table>
     <br />
     <table style="width:100%;" cellpadding="0" cellspacing="0">
   <tr>
 <td class="col_115"><strong>Dział 1.1.o.</strong></td>
 <td class="col_115" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;">W tym uwzględnione </td>
 <td style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;" class="wciecie">orzeczenie wykonania zastępczej kary pozbawienia wolności w miejsce kary ograniczenia wolności (art. 65 § 1 kw)</td>
 <td class="col_36" style="border-top-style: solid; border-left-style: solid; border-width: thin; border-color: #666666; border-bottom-style: solid;">01</td>
 <td class="col_200" style="border-style: solid; border-width: thin; border-color: #666666"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!1!4')">
     <asp:Label CssClass="normal" ID="tab_11o_w01_c01" runat="server" Text="0"></asp:Label>
     </a></td>
   </tr>
   </table>
     <br />
</div>
   &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder03"></asp:PlaceHolder>

       <div id="Div11p"  class="page-break">

    <br />
</div>

     <div id="Div115"  class="page-break">

     <strong>Dział 1.1.5 Wpływ i załatwienie spraw w postępowaniu przyspieszonym (Rep. K)  </strong>

   <br />
   <table style="width:100%;" cellpadding="0" cellspacing="0">
 <tr>
     <td class="col_140 borderTopLeft" align="center" rowspan="5">Wpływ - liczba spraw</td>
     <td align="center" class="col_140 borderTopLeft" rowspan="5">Liczba oskarżonych objętych wnioskami (ogółem)</td>

     <td colspan="6" align="center" class="borderTopLeftRight">Liczba spraw zakończonych</td>
 </tr>

 <tr>
     <td align="center" class="col_140 borderTopLeft" rowspan="4">ogółem</td>

     <td colspan="5" align="center" class="borderTopLeftRight">w tym</td>
 </tr>

 <tr>
     <td align="center" class="col_140 borderTopLeft" rowspan="3" >wyrokiem</td>
     <td  colspan="4" align="center" class="borderTopLeftRight">postanowieniem</td>
 </tr>
 <tr>
     <td align="center" class="col_140 borderTopLeft" rowspan="2">o rozpoznaniu sprawy w trybie uproszczonym (art.517g §1 kpk zdanie 1</td>
     <td colspan="3" align="center" class="borderTopLeftRight">o przekazaniu sprawy prokuratorowi</td>
 </tr>
 <tr>
     <td align="center" class="col_140 borderTopLeft">art.517g §1 kpk zdanie 2</td>
     <td align="center" class="col_140 borderTopLeft">art.517g §2 kpk </td>
     <td align="center" class="col_140 borderTopLeftRight">art.517g §3 kpk</td>
 </tr>
 <tr>
     <td align="center" class="col_140 borderTopLeft">1</td>
     <td align="center" class="col_140 borderTopLeft">2</td>
     <td align="center" class="col_140 borderTopLeft">3</td>
     <td align="center" class="col_140 borderTopLeft">4</td>
     <td align="center" class="col_140 borderTopLeft">5</td>
     <td align="center" class="col_140 borderTopLeft">6</td>
     <td align="center" class="col_140 borderTopLeft">7</td>
     <td align="center" class="col_140 borderTopLeftRight">8</td>
 </tr>
 <tr>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!1!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!2!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c02" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!31!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c03" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!4!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c04" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!5!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c05" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!6!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c06" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!7!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c07" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!8!4')">  <asp:Label CssClass="normal" ID="tab_115_w01_c08" runat="server" Text="0"></asp:Label>     </a></td>
 </tr>
   </table>
   <br />

   <br />
   </div>
   <div id="Div116"  class="page-break">
 <strong> Dział 1.1.6 Postanowienie o zabezpieczeniu roszczeń w postępowaniu sądowym</strong>

 <br />
 <table cellpadding="0" cellspacing="0" style="width: 50%">
     <tr>
   <td class="borderTopLeft" colspan="2" align="center">Wyszczególnienie</td>
   <td class="borderTopLeftRight" align="center">Liczby</td>
     </tr>
     <tr>
   <td class="borderTopLeft" colspan="2" align="center">0</td>
   <td class="borderTopLeftRight" align="center">1</td>
     </tr>
     <tr>
   <td class="borderTopLeft" align="center"><strong>rep. K</strong></td>
   <td class="borderTopLeft col_36" align="center">01</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.6!1!4')">  <asp:Label CssClass="normal" ID="tab_116_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center"><strong>wykaz. Ko</strong></td>
   <td class="borderTopLeftBottom col_36" align="center">02</td>
   <td class="borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.6!1!4')">  <asp:Label CssClass="normal" ID="tab_116_w02_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
 </table>
 <br />
 <br />
 </div>
     <div id="Div117a"  class="page-break">
 <strong> Dział 1.1.7.a. Przesłuchanie małoletnich świadków i pokrzywdzonych świadków (liczba osób) </strong>
 <br />

   <br />
   <br />
   <table cellpadding="0" cellspacing="0" style="width:100%;">
 <tr>
     <td align="center" class="borderAll" colspan="3" rowspan="4">Przesłuchano szczególne grupy świadków</td>
     <td align="center" class="borderAll" colspan="11">Przesłuchanie w trybie art.</td>
 </tr>
 <tr>
     <td align="center" class="borderAll" colspan="5">185a kpk</td>
     <td align="center" class="borderAll" colspan="3">185b kpk</td>
     <td align="center" class="borderAll" colspan="3">185c §2 kpk</td>
 </tr>
 <tr>
     <td align="center" class="borderAll" rowspan="2">ogółem (kol.2 do 5)</td>
     <td align="center" class="borderAll" colspan="2">dziewczynki</td>
     <td align="center" class="borderAll" colspan="2">chłopcy</td>
     <td align="center" class="borderAll" rowspan="2">ogółem (kol. 7+8)</td>
     <td align="center" class="borderAll" rowspan="2">dziew-czynki</td>
     <td align="center" class="borderAll" rowspan="2">chłopcy</td>
     <td align="center" class="borderAll" rowspan="2">ogółem (kol. 10+11)</td>
     <td align="center" class="borderAll" rowspan="2">kobiety</td>
     <td align="center" class="borderAll" rowspan="2">mężczyźni</td>
 </tr>
 <tr>
     <td align="center" class="borderAll">do 15 lat</td>
     <td align="center" class="borderAll">15-18 lat</td>
     <td align="center" class="borderAll">do 15 lat</td>
     <td align="center" class="borderAll">15-18 lat</td>
 </tr>
 <tr>
     <td align="center" class="borderAll" colspan="3">0</td>
     <td align="center" class="borderAll">1</td>
     <td align="center" class="borderAll">2</td>
     <td align="center" class="borderAll">3</td>
     <td align="center" class="borderAll">4</td>
     <td align="center" class="borderAll">5</td>
     <td align="center" class="borderAll">6</td>
     <td align="center" class="borderAll">7</td>
     <td align="center" class="borderAll">8</td>
     <td align="center" class="borderAll">9</td>
     <td align="center" class="borderAll">10</td>
     <td align="center" class="borderAll">11</td>
 </tr>
 <tr>
     <td align="center" class="borderAll" colspan="2">ogółem (wiersz 01 = w. 02+03+04)</td>
     <td align="center" class="borderAll">01</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c02" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c03" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c04" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c05" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c06" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c07" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c08" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!9!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c09" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!10!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c10" runat="server" Text="0"></asp:Label>     </a></td>
<td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.a!11!4')">  <asp:Label CssClass="normal" ID="tab_117a_w01_c11" runat="server" Text="0"></asp:Label>     </a></td>
 </tr>
 <tr>
     <td align="center" class="borderAll" rowspan="3">w tym</td>
     <td align="center" class="borderAll">jeden raz</td>
     <td align="center" class="borderAll">02</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c01" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c02" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c03" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c04" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c05" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c06" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c07" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w02_c08" runat="server" Text="0"></asp:Label>     </a></td>
     <td align="center" class="borderTopLeft" colspan="3" rowspan="3">&nbsp;</td>
 </tr>
 <tr>
     <td align="center" class="borderAll">więcej razy z powodu wyjścia na jaw istotnych okoliczności, których wyjaśnienie wymaga ponownego przesłuchania </td>
     <td align="center" class="borderAll">03</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
 </tr>
 <tr>
     <td align="center" class="borderAll">gdy zażądał tego podejrzany, oskarżony, który nie miał obrońcy w czasie pierwszego przesłuchania</td>
     <td align="center" class="borderAll">04</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
 </tr>
 <tr>
     <td align="center" class="borderAll" rowspan="2">w tym</td>
     <td align="center" class="borderAll">w przyjaznym pokoju przesłuchań *) w sądzie</td>
     <td align="center" class="borderAll">05</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!9!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!10!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c10" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.a!11!4')">  <asp:Label CssClass="normal" ID="tab_117a_w05_c11" runat="server" Text="0"></asp:Label>  </a></td>
 </tr>
 <tr>
     <td align="center" class="borderAll">poza sądem</td>
     <td align="center" class="borderAll">06</td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!1!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!2!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!3!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!4!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!5!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!6!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!7!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!8!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c08" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!9!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c09" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!10!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c10" runat="server" Text="0"></asp:Label>  </a></td>
     <td align="center" class="borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.a!11!4')">  <asp:Label CssClass="normal" ID="tab_117a_w06_c11" runat="server" Text="0"></asp:Label>  </a></td>
 </tr>
   </table>
   <br />
   </div>
 <div id="Div117b"  class="page-break">
   <table style="width:100%;">
<tr>
    <td  class="col_29">
    </td>
    <td>

<strong>   Dział 1.1.7.b. Liczba przyjaznych pokoi przesłuchań*) w sądzie </strong>
    </td>
    <td valign="bottom" align="right">
<a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!1!4')"> <asp:TextBox ID="tab_117b_w01_c2" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
   </td>
</tr>
<tr>
    <td  class="col_29">
        &nbsp;</td>
    <td>
  *) przyjazny pokój przesłuchań – pomieszczenie przeznaczone do przeprowadzenia przesłuchań szczególnych grup świadków odpowiadające standardom określonym w rozporządzeniu Ministra Sprawiedliwości z dnia 18 grudnia 2013 r. w sprawie sposobu przygotowania przesłuchania przeprowadzanego w trybie określonym w art. 185a–185c Kodeksu postępowania karnego</td>
    <td valign="bottom" align="right">
    </td>
</tr>
</table>
 </div>

    <br />
  </div>

       <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; ">

             &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder04"></asp:PlaceHolder>

            &nbsp;<br />

       <div id="tab42">

            <br />
            <b>  Dział 4.2. </b>Nadzór nad postępowaniem przygotowawczym
           <table style="width: 50%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft" colspan="2" align="center">Wyszczególnienie</td>
                   <td class="borderTopLeftRight " colspan="2" align="center">Liczba spraw <sup>4</sup></td>
               </tr>
               <tr>
                   <td class="borderTopLeft" colspan="2" align="center">0</td>
                   <td class="borderTopLeftRight" colspan="2" align="center">1</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" rowspan="3" align="center">Wnioski prokuratora złożone o zastosowanie lub przedłużenie tymczasowego aresztowania    w toku śledztwa lub dochodzenia (art. 250  i 263 kpk) </td>
                   <td class="borderTopLeft" align="center">razem (w. 02 + 03)</td>
                   <td class="borderTopLeft col_36" align="center">01</td>
            <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      </tr>
               <tr>
                   <td class="borderTopLeft" align="center">o zastosowanie</td>
                   <td class="borderTopLeft col_36" align="center">02</td>
             <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                     </tr>
               <tr>
                   <td class="borderTopLeft" align="center">o przedłużenie</td>
                   <td class="borderTopLeft col_36" align="center">03</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft" colspan="2" align="center">Zastosowanie kary porządkowej w postaci aresztowania (art. 287 § 2 kpk i 290 kpk) na wniosek prokuratora</td>
                   <td class="borderTopLeft col_36" align="center">04</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft" rowspan="2" align="center">Kontrola i utrwalanie treści rozmów telefonicznych (art. 237 kpk)</td>
                   <td class="borderTopLeft" align="center">zarządzenie przez sąd na wniosek prokuratora (§ 1)</td>
                   <td class="borderTopLeft col_36" align="center">05</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=5!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center">zatwierdzenie przez sąd zarządzeń prokuratora w wypadkach niecierpiących zwłoki (§ 2)</td>
                   <td class="borderTopLeft col_36" align="center">06</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=6!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom" align="center" colspan="2">Uwzględnione przez sąd wnioski prokuratora o zastosowanie tymczasowego aresztowania </td>
                   <td class="borderTopLeftBottom col_36" align="center">07</td>
                   <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=7!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               </table>

            <br />
           *) Liczby spraw wniesionych lub uwzględnionych – według treści wyszczególnienia, w okresie sprawozdawczym. Liczby te są niezależne od siebie w danym okresie sprawozdawczym
       </div>
       <div id="tab43">

            <br />
            <b>  Dział 4.3 </b>Przedłużenie tymczasowego aresztowania
            <table style="width: 50%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeftBottom" rowspan="2" align="center">Przedłużenie przez Sąd Apelacyjny tymczasowego aresztowania w trybie art. 263 § 4 kpk na wniosek sądu</td>
                   <td class="borderTopLeft col_125" align="center">wobec osób</td>
                   <td class="borderTopLeft col_36" align="center">01</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!4.3!1!4')">  <asp:Label CssClass="normal" ID="tab_43_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom" align="center">wobec spraw</td>
                   <td class="borderTopLeftBottom col_36" align="center">02</td>
                   <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!4.3!1!4')">  <asp:Label CssClass="normal" ID="tab_43_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               </table>
       </div>
       <div id="tab5">

            <br />
            <b>  Dział 5. </b> Wnioski dotyczące postępowania międzynarodowego w sprawach karnych (Wykaz Kop) (z wył. państw członkowskich UE)

           <table cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderAll  center" colspan="2">Wyszczególnienie</td>
                   <td class="borderAll center col_150">Liczby</td>
               </tr>
               <tr>
                   <td class="borderAll  center" colspan="2">0</td>
                   <td class="borderAll center col_150">1</td>
               </tr>
               <tr>
                   <td class="borderAll  wciecie" >Czynności sądu w sprawach wniosków Ministra Sprawiedliwości o przejęcie obywatela polskiego skazanego przez sąd państwa obcego, w celu wykonania kary pozbawienia wolności w Rzeczypospolitej Polskiej (art. 608 kpk), </td>
                   <td class="borderAll center col_50">01</td>
                            <td class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!5!1!4')">  <asp:Label CssClass="normal" ID="tab_5_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll  wciecie" >Czynności sądu w sprawach wniosków Ministra Sprawiedliwości o przejęcie skazanego przez sąd polski cudzoziemca przez państwo, którego jest on obywatelem, w celu odbycia kary pozbawienia wolności (art. 610 kpk).</td>
                   <td class="borderAll center col_50">02</td>
                   <td class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=2!5!1!4')">  <asp:Label CssClass="normal" ID="tab_5_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll  wciecie">Czynności sądu w sprawach wniosków państw obcych o wykonanie prawomocnych orzeczeń o zabezpieczenie mienia (art. 611d § 2 kpk)</td>
                   <td class="borderAll center col_50">03</td>
                   <td class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=3!5!1!4')">  <asp:Label CssClass="normal" ID="tab_5_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll  wciecie" >inne</td>
                   <td class="borderAll center col_50">04</td>
                   <td class="borderAll center col_150"><a href="javascript:openPopup('popup.aspx?sesja=4!5!1!4')">  <asp:Label CssClass="normal" ID="tab_5_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               </table>
       </div>
       <div id="tab6">

            <br />
            <b>  Dział 6.  </b>Środki zapobiegawcze

           <table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderAll" colspan="5" align="center">Wyszczególnienie</td>
                   <td class="borderAll center col_130">Liczby</td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="5" align="center">0</td>
                   <td class="borderAll center col_130">1</td>
               </tr>
               <tr>
                   <td class="borderAll" rowspan="14">Tymczasowe aresztowanie Wykaz „Ar” a) (co do osób)</td>
                   <td class="borderAll" colspan="2" rowspan="4">w okresie s<br />
                       prawozdawczym</td>
                   <td class="borderAll">tymczasowo aresztowano osób w postępowaniu sądowym</td>
                   <td class="borderAll">01</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">w tym cudzoziemców</td>
                   <td class="borderAll">02</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">liczba zażaleń dot. tymczasowego aresztowania (wpływ)</td>
                   <td class="borderAll">03</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=3!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">liczba uwzględnionych zażaleń dot. tymczasowego aresztowania </td>
                   <td class="borderAll">04</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=4!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll wciecie" rowspan="6" colspan="2">Stan w ostatnim dniu okresu sprawo-zdawczego</td>
                   <td class="borderAll">razem (wiersz 06 do 10) </td>
                   <td class="borderAll">05</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=5!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">do 3 miesięcy</td>
                   <td class="borderAll">06</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=6!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">pow. 3 do 6 miesięcy</td>
                   <td class="borderAll">07</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=7!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">pow. 6 do 12 miesięcy</td>
                   <td class="borderAll">08</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=8!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">pow. 12 mies. do 2 lat</td>
                   <td class="borderAll">09</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=9!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">pow 2 lat</td>
                   <td class="borderAll">10</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=10!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll wciecie" rowspan="4" style="border-width: 0px medium medium medium; border-left-color: #808080; border-top-style: 0; border-right-style: 0; border-bottom-style: 0; border-left-style: solid" colspan="2">Wykreślono z wykazu w okresie sprawozdawczym</td>
                   <td class="borderAll">razem – (w. 12 do 14)</td>
                   <td class="borderAll">11</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=11!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">z powodu uchylenia tymczasowego aresztowania</td>
                   <td class="borderAll">12</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=12!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">z powodu przekazania innemu sądowi lub organowi</td>
                   <td class="borderAll">13</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=13!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">z innych przyczyn</td>
                   <td class="borderAll">14</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=14!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" rowspan="14">Inne środki zapobiegawcze (wszystkie, które w okresie sprawozdawczym zostały zastosowane przez sąd w postępowaniu sądowym, oraz te, które wpłynęły z aktem oskarżenia)</td>
                   <td class="borderAll" colspan="2" rowspan="3">Poręczenie</td>
                   <td class="borderAll">majątkowe</td>
                   <td class="borderAll">15</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=15!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">osoby godnej zaufania</td>
                   <td class="borderAll">16</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=16!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">społeczne</td>
                   <td class="borderAll">17</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=17!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" rowspan="4">Dozór policyjny</td>
                   <td class="borderAll" colspan="2">ogółem</td>
                   <td class="borderAll">18</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=18!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" rowspan="2">w tym na podstawie art. 275 § 2 kpk</td>
                   <td class="borderAll">z zakazem kontaktowania się z pokrzywdzonym</td>
                   <td class="borderAll">19</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=19!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">z zakazem zbliżania się do określonych osób na wskazaną odległość</td>
                   <td class="borderAll">20</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=20!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="2">w tym orzeczony na podstawie art. 275 § 3 kpk</td>
                   <td class="borderAll">21</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=21!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="2" rowspan="2">Nakaz opuszczenia lokalu mieszkalnego</td>
                   <td class="borderAll">Ogółem</td>
                   <td class="borderAll">22</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=22!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">w tym przedłużenie nakazu zastosowanego przez prokuratora lub sąd na dalsze okresy (art. 275a §4 kpk)</td>
                   <td class="borderAll">23</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=23!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="2" rowspan="2">Zakaz opuszczania kraju</td>
                   <td class="borderAll">Ogółem</td>
                   <td class="borderAll">24</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=24!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll">w tym z zatrzymaniem paszportu lub innego dokumentu</td>
                   <td class="borderAll">25</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=25!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="3">Zawieszenie w czynnościach służbowych lub w wykonywaniu zawodu</td>
                   <td class="borderAll">26</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=26!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w26_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="3">Powstrzymanie się od określonej działalności</td>
                   <td class="borderAll">27</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=27!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w27_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderAll" colspan="3">Powstrzymanie się od prowadzenia określonego rodzaju pojazdów</td>
                   <td class="borderAll">28</td>
                   <td class="borderAll center col_130"><a href="javascript:openPopup('popup.aspx?sesja=28!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w28_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>           </table>
            <sup>a)</sup>  W wykazie „Ar” ewidencjonuje się nazwiska osób tymczasowo aresztowanych pozostających do dyspozycji danego sądu w sprawach pierwszoinstancyjnych rozpoznawanych przez ten sąd. Nie wpisuje się nazwisk osób w trakcie postępowania przygotowawczego przekazanych z prokuratury z wnioskiem o zastosowanie tymczasowego aresztowania, a także nie wykazuje się danych z podręcznych kontrolek prowadzonych przez sądy drugiej instancji (§ 416)
            <br />
            Uwaga: W wierszach od 01 do 14 należy wykazać liczbę osób, a w wierszach od 15 do 24 – liczbę zastosowanych środków. W stanie ewidencyjnym należy wykazać wszystkie osoby wpisane do wykazu Ar, które pozostają do dyspozycji sądu (§ 417 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej)(Dz. Urz. MS. Nr 5, poz. 22 z późn. zm.)</div>
       <div id="tab71">

            <br />
            <br />
            <br />
            <br />
            <b>  Dział 7.1. </b>Kontrolka skarg (w wydziale, którego sprawy skarga dotyczy) (§ 448<sup>5</sup>ust 1 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. Nr 5, poz. 22, z późn. zm.)<table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft" colspan="2" rowspan="2">Wyszczególnienie</td>
                   <td class="borderTopLeft col_140" rowspan="2">Wpłynęło</td>
                   <td class="borderTopLeft col_140" rowspan="2">Przesłano do sądu właściwego</td>
                   <td class="borderTopLeftRight" colspan="5">Rozpoznanie skargi</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_140">uwzględniono</td>
                   <td class="borderTopLeft col_140">oddalono</td>
                   <td class="borderTopLeft col_140">inne</td>
                   <td class="borderTopLeft col_140">Zarządzono wypłatę przez Skarb Państwa</td>
                   <td class="borderTopLeftRight col_140">Kwota (w złotych)</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_140">1</td>
                   <td class="borderTopLeft col_140">2</td>
                   <td class="borderTopLeft col_140">3</td>
                   <td class="borderTopLeft col_140">4</td>
                   <td class="borderTopLeft col_140">5</td>
                   <td class="borderTopLeft col_140">6</td>
                   <td class="borderTopLeftRight col_140">7</td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom wciecie">Skargi na pracę sądu</td>
                   <td class="borderTopLeftBottom col_36">01</td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               </table>
       </div>

         &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder06"></asp:PlaceHolder>
    <br />

       <div id="tab8abc">
           <br />
        <table style="width:100%;">
                <tr>
                    <td><strong>Dział 8.a.</strong> Sprawy rozpatrywane w składzie zawodowym w trybie art. 28 §3 kpk</td>
                    <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!8.a!1!4')">  <asp:Label CssClass="normal" ID="tab_8a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td><strong>Dział 8.b.</strong> Sprawy załatwione przez skład zawodowy art. 28 §3 kpk</td>
                    <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!8.b!1!4')">  <asp:Label CssClass="normal" ID="tab_8b_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td><strong>Dział 8.c.</strong> Sprawy niezałatwione, w których orzeka skład zawodowy art. 28 §3 kpkz wyłączeniem spraw z litery a)</td>
                    <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!8.c!1!4')">  <asp:Label CssClass="normal" ID="tab_8c_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
            </table>    <br />
       </div>
             &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder07"></asp:PlaceHolder>
       <div id="tab92">

            <br />
       </div>
          <div id="tab10">

            <br />
         <b>  Dział 10. </b>Ewidencja spraw dotyczących próśb o ułaskawienie w sądzie rejonowym<br />
&nbsp;<table style="width: 50%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft" align="center" colspan="4">WYSZCZEGÓLNIENIE</td>
                   <td class="borderTopLeftRight col_125">Liczba próśb</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center" colspan="4">0</td>
                   <td class="borderTopLeftRight col_125">1</td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="3">Pozostało z okresu ubiegłego</td>
                   <td class="borderTopLeft col_36">01</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="3">Wpłynęło</td>
                   <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="3">Załatwiono (wiersze 4+5+6+10+14)</td>
                   <td class="borderTopLeft col_36">03</td>
                     <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" rowspan="11">z tego</td>
                   <td class="borderTopLeft wciecie" colspan="2">pozostawiono bez rozpoznania (art. 566 kpk)</td>
                   <td class="borderTopLeft col_36">04</td>
                     <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">pozostawiono bez dalszego biegu (art. 564 § 1 i 3 kpk)</td>
                   <td class="borderTopLeft col_36">05</td>
                     <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=5!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">przesłano akta Prokuratorowi Generalnemu (art. 564 § 1 i 3 kpk) (wiersze 7 do 9)</td>
                   <td class="borderTopLeft col_36">06</td>
                <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=6!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
           </tr>
               <tr>
                   <td class="borderTopLeft wciecie" rowspan="3">z tego w terminie (od wpływu prośby)</td>
                   <td class="borderTopLeft wciecie">do 1 miesiąca</td>
                   <td class="borderTopLeft col_36">07</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=7!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">powyżej 1 do 3 miesięcy</td>
                   <td class="borderTopLeft col_36">08</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=8!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">powyżej 3 miesięcy</td>
                   <td class="borderTopLeft col_36">09</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=9!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">przekazano sądowi II instancji (art. 564 § 2 kpk) (wiersze 11 do 13) </td>
                   <td class="borderTopLeft col_36">10</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=10!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" rowspan="3">z tego w terminie (od wpływu prośby)</td>
                   <td class="borderTopLeft wciecie">do 1 miesiąca</td>
                   <td class="borderTopLeft col_36">11</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=11!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">powyżej 1 do 3 miesięcy</td>
                   <td class="borderTopLeft col_36">12</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=12!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">powyżej 3 miesięcy</td>
                   <td class="borderTopLeft col_36">13</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=13!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">załatwiono w inny sposób</td>
                   <td class="borderTopLeft col_36">14</td>
                   <td class="borderTopLeftRight col_125"><a href="javascript:openPopup('popup.aspx?sesja=14!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom wciecie" colspan="3">Pozostało na okres następny</td>
                   <td class="borderTopLeftBottom col_36">15</td>
                   <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=15!10!1!4')">  <asp:Label CssClass="normal" ID="tab_10_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
           </table>

              <br />
              W poniższych działach odnoszących się do biegłych i tłumaczy wykazujemy dane dotyczące opinii i tłumaczeń zleconych po 1 stycznia 2017r.</div>
       <div id="tab111">

            <br />
         <b>  Dział 11.1. </b>Liczba biegłych/podmiotów wydających opinie w sprawach (z wył. tłumaczy przysięgłych)<table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft" colspan="2" rowspan="2" align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeftRight" colspan="4" align="center">Liczba powołanych biegłych</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_250">Razem (kol. 2-4)</td>
                   <td class="borderTopLeft col_250">bieli sądowi</td>
                   <td class="borderTopLeft col_250">biegli spoza listy</td>
                   <td class="borderTopLeftRight col_250">inne podmioty</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" colspan="2" align="center">0</td>
                   <td class="borderTopLeft col_250">1</td>
                   <td class="borderTopLeft col_250">2</td>
                   <td class="borderTopLeft col_250">3</td>
                   <td class="borderTopLeftRight col_250">4</td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Ogółem (w. 02-04)</td>
                   <td class="borderTopLeft col_36">01</td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!1!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!2!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!3!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_250"><a href="javascript:openPopup('popup.aspx?sesja=1!11.1!4!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">K</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!1!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!2!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!3!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_250"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!4!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">W </td>
                   <td class="borderTopLeft col_36">03</td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=3!11.1!1!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=3!11.1!2!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_250"><a href="javascript:openPopup('popup.aspx?sesja=3!11.1!3!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_250"><a href="javascript:openPopup('popup.aspx?sesja=3!11.1!4!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom wciecie">Inne</td>
                   <td class="borderTopLeftBottom col_36">04</td>
                   <td class="borderTopLeftBottom col_250"><a href="javascript:openPopup('popup.aspx?sesja=4!11.1!1!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_250"><a href="javascript:openPopup('popup.aspx?sesja=4!11.1!2!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_250"><a href="javascript:openPopup('popup.aspx?sesja=4!11.1!3!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_250"><a href="javascript:openPopup('popup.aspx?sesja=4!11.1!4!4')">  <asp:Label CssClass="normal" ID="tab_11_1_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
           </table>
       </div>

         <div id="tab112">

            <br />
         <b>  Dział 11.2. </b>Terminowość sporządzania opinii pisemnych(z wył. tłumaczy przysięgłych) <table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft" align="center" colspan="2" rowspan="3">Sprawy wg. repetytoriów</td>
                   <td class="borderTopLeftRight" align="center" colspan="8">Liczba sporządzonych opinii</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_125" rowspan="2">razem (kol.1= 2 do 5 = 6 do 8)</td>
                   <td class="borderTopLeft col_125" rowspan="2">w ustalonym terminie</td>
                   <td class="borderTopLeft" align="center" colspan="3">po ustalonym terminie</td>
                   <td class="borderTopLeftRight" align="center" colspan="3">wg. czasu wydania opinii</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_125">do 30 dni</td>
                   <td class="borderTopLeft col_125">pow. 1 do 3 miesięcy</td>
                   <td class="borderTopLeft col_125">pow. 3 miesięcy</td>
                   <td class="borderTopLeft col_125">do 30 dni</td>
                   <td class="borderTopLeft col_125">pow. 1 do 3 miesięcy</td>
                   <td class="borderTopLeftRight col_125">pow. 3 miesięcy</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_125">1</td>
                   <td class="borderTopLeft col_125">2</td>
                   <td class="borderTopLeft col_125">3</td>
                   <td class="borderTopLeft col_125">4</td>
                   <td class="borderTopLeft col_125">5</td>
                   <td class="borderTopLeft col_125">6</td>
                   <td class="borderTopLeft col_125">7</td>
                   <td class="borderTopLeftRight col_125 col_125">8</td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Ogółem (w. 02-04)</td>
                   <td class="borderTopLeft col_36">01</td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!1!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!2!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!3!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!4!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!5!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!6!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!7!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_125 col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!11.2!8!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">K</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!1!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!2!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!3!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!4!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!5!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!6!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!7!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_125 col_125"><a href="javascript:openPopup('popup.aspx?sesja=2!11.2!8!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
           </tr>
               <tr>
                   <td class="borderTopLeft wciecie">W</td>
                   <td class="borderTopLeft col_36">03</td>
                 <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!1!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!2!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!3!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!4!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!5!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!6!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!7!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_125 col_125"><a href="javascript:openPopup('popup.aspx?sesja=3!11.2!8!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
               <tr>
                   <td class="borderTopLeftBottom wciecie">Inne</td>
                   <td class="borderTopLeftBottom col_36">04</td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!1!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!2!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!3!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!4!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!5!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!6!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!7!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=4!11.2!8!4')">  <asp:Label CssClass="normal" ID="tab_11_2_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
           </table>

             <br />
             W przypadku złożenia przez biegłego opinii w terminie przedłużonym przez sąd, uznaje się ją za sporządzoną w ustalonym terminie.</div>

      &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder08"></asp:PlaceHolder>

       <div id="tab12.1">

            <br />
            <br />
        <table style="width:100%;">
                <tr>
                    <td>
         <b>  Dział 12.1. </b>Liczba powołanych tłumaczy</td>
                    <td class="borderAll col_125"><a href="javascript:openPopup('popup.aspx?sesja=1!12.1!1!4')">  <asp:Label CssClass="normal" ID="tab_12_1_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
            </table>
            <br />
       </div>

       <div id="tab122">

            <br />
            <br />
            <strong>Dział 12.2 </strong>Terminowość sporządzania tłumaczeń pisemnych<table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeftRight" align="center" colspan="12">Liczba sporządzonych tłumaczeń pisemnych </td>
               </tr>
               <tr>
                   <td class="borderTopLeft" rowspan="2" align="center">razem (kol.1= 2 do 5 = 6 do 8 )</td>
                   <td class="borderTopLeft col_140" rowspan="2">w ustalonym terminie</td>
                   <td class="borderTopLeft" colspan="3" align="center">po ustalonym terminie</td>
                   <td class="borderTopLeftRight" colspan="3" align="center">wg czasu wydania tłumaczenia</td>
               </tr>
               <tr>

                   <td class="borderTopLeft" align="center">do 30 dni</td>
                   <td class="borderTopLeft" align="center">pow. 1 do 3 miesięcy</td>
                   <td class="borderTopLeftRight" align="center">pow. 3 miesięcy</td>

                   <td class="borderTopLeft" align="center">do 30 dni</td>
                   <td class="borderTopLeft" align="center">pow. 1 do 3 miesięcy</td>
                   <td class="borderTopLeftRight" align="center">pow. 3 miesięcy</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_140">1</td>
                   <td class="borderTopLeft col_140">2</td>
                   <td class="borderTopLeft col_140">3</td>
                   <td class="borderTopLeft col_140">4</td>
                   <td class="borderTopLeft col_140">5</td>
                   <td class="borderTopLeft col_140">6</td>
                   <td class="borderTopLeft col_140">7</td>
                   <td class="borderTopLeftRight col_140">8</td>
               </tr>
               <tr>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!12.2!8!4')">  <asp:Label CssClass="normal" ID="tab_12_2_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              </tr>
           </table>
       </div>
       <div id="tab123">

            <br />

            <br />
            <br />
            <strong>Dział 12.3 </strong>Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo
           <table style="width: 100%;" >
               <tr>
                   <td class="borderAll center" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                   <td class="borderAll center" colspan="8">Skierowanie rachunku&nbsp;do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
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
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!1!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!2!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!3!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!4!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!5!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!6!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!7!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!8!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!9!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>

                      <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!10!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>

                     <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!11!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>

                      <td class="borderAll center col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!12.3!12!4')">  <asp:Label CssClass="normal" ID="tab_12_3_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
           </table>
            <br />
            <br /><b>Dział 13. </b>Obciążenia administracyjne respondentów<br />Proszę podać czas (w minutach) przeznaczony na:<br />
            <table style="width:100%;">
                <tr>
                    <td class="col_37">&nbsp;</td>
                    <td>przygotowanie danych dla potrzeb wypełnianego formularza</td>
                    <td class="col_125 borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!13!1!4')">
                        <asp:TextBox ID="tab_13_w01_col01" runat="server" style="text-align:center"  CssClass="normal">0</asp:TextBox>
                        </a></td>
                </tr>
                <tr>
                    <td class="col_37">&nbsp;</td>
                    <td>wypełnienie formularza</td>
                    <td class="col_125 borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!13!1!4')">
                        <asp:TextBox ID="tab_13_w02_col01" runat="server" style="text-align:center" CssClass="normal">0</asp:TextBox>
                        </a></td>
                </tr>
            </table>
            <br />
            <br />&nbsp;<p style="margin-bottom: 0cm">
                &nbsp;</p>
            <br />
            </P>
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
           </div>
</asp:Content>