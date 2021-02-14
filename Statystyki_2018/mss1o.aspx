<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss1o.aspx.cs" Inherits="Statystyki_2018.mss1o" %>

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
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div id="Div2" style="z-index: 10;">

            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td colspan="3" class="borderAll">MINISTERSTWO SPRAWIEDLIWOŚCI, Al. Ujazdowskie 11, 00-950 Warszawa</td>
                </tr>
                <tr>
                    <td class="borderAll col_33prc">
                        <br />
                        Sąd okręgowy
                            <br />
                        <br />
                        w ……………………………………</td>
                    <td class="borderAll col_33prc center"><strong><span class="auto-style1">MS-S1o<br />
                    </span></strong>
                        <br />
                        <strong><span class="auto-style2">SPRAWOZDANIE </span></strong>
                        <br />
                        w sprawach cywilnych</td>
                    <td class="borderAll col_33prc">Adresat
                            <br />
                        Ministerstwo Sprawiedliwości
                            <br />
                        Departament Strategii i Funduszy Europejskich</td>
                </tr>
                <tr>
                    <td class="borderAll">Obszar Sądu Apelacyjnego
                            <br />
                        <br />
                        w&nbsp; ……………………………………..</td>
                    <td class="center borderAll">za … kwartał …**) 20… r.
                    </td>
                    <td class="borderAll col_33prc">
                        <br />
                        Termin przekazania: do 10 dnia kalendarzowego po każdym kwartale z danymi narastającymi od początku roku do końca kwartału
                        <br />
                    </td>
                </tr>
            </table>
            <br />

            <br />
        </div>

        <br />
        <br />
        <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>
        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.1.1.</strong> Załatwione sprawy Dział 1.1.1. (kol. 3) o rozwód (wiersz 4 do 8) w wypadku gdy pierwotnie wpłynęła sprawa o separację</td>
                <td class="borderAll center col_90">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_1_1_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.1.2.</strong> Załatwione sprawy Dział 1.1.1. (kol. 3) o separację (wiersz 9 do 13) w wypadku gdy pierwotnie wpłynęła sprawa o rozwód </td>
                <td class="borderAll center col_90">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.2!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_1_2_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
            </tr>
        </table>
        W wypadku gdy wpłynęła sprawa o separację i została zarejestrowana w rep. Ns, a w trakcie postępowania orzeczono rozwód, to sprawę w rep. Ns należy uznać  za załatwioną  w inny
sposób, a w rep. C wpisać ją pod nowym numerem, w tym także jako ponownie wpisaną. Ponadto należy  wykazać  ją w następujący sposób:
       <table style="width: 100%;">
           <tr>
               <td><strong>Dział 1.1.1.3.</strong> Załatwione sprawy Dział 1.1.1. (kol.. 3) o rozwód (wiersz 4 do 8) w wypadku, gdy pierwotnie wpłynął wniosek o separację  </td>
               <td class="borderAll center col_90">
                   <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.3!1!4')">
                       <asp:Label CssClass="normal" ID="tab_1_1_1_3_w01_c01" runat="server" Text="0"></asp:Label></a>
               </td>
           </tr>
       </table>
        <br />
        <div id='1.1.a' class="page-break">
            <strong>Dział 1.1.a</strong> Pozwy zbiorowe rep. C
    <table>
        <tr>
            <td class="center borderAll" colspan="3">Wyszczególnienie </td>
            <td class="center borderAll">Liczby spraw</td>
        </tr>
        <tr>
            <td class="center borderAll col_200" colspan="3">0</td>
            <td class="center borderAll">1</td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Wpłynęło </td>
            <td class="borderAll col_36">1</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Załatwiono</td>
            <td class="borderAll col_36">2</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w02_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="3">w tym</td>
            <td class="borderAll wciecie">odrzucono</td>
            <td class="borderAll col_36">3</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w03_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">oddalono</td>
            <td class="borderAll col_36">4</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w04_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">zwrócono</td>
            <td class="borderAll col_36">5</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w05_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Pozostało</td>
            <td class="borderAll col_36">6</td>
            <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.a!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_1_a_w06_c01" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <br />
        <div id="1.1.b" class="page-break">
            <strong>Dział 1.1.b</strong> W tym
              <table>
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="6">W związku z art. 58</td>
                      <td class="borderAll wciecie" rowspan="4">§ 1 bez zdania pierwszego i § 1a k.r.o</td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym w wyniku porozumienia</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym w wyniku porozumienia</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">§ 2 bez zdania pierwszego i drugiego i § 3 k.r.o. </td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="2">Udzielono zabezpieczenia w trybie art. 445 kpc w sprawach o </td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="2">Liczba spraw, w których orzeczono eksmisję</td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba ojców, którzy złożyli wniosek o powierzenie wykonywania władzy rodzicielskiej</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym liczba ojców, których wniosek sąd uwzględnił</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba matek, które złożyły wniosek o powierzenie wykonywania władzy rodzicielskiej</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym liczba matek, których wniosek sąd uwzględnił </td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba spraw, w których rodzice przedstawili porozumienie o sposobie wykonywania władzy rodzicielskiej i utrzymywaniu kontaktów z dzieckiem</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym liczba spraw, w których sąd uwzględnił porozumienie </td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.c" class="page-break">
            <strong>Dział 1.1.c</strong>&nbsp; O opróżnienie lokalu mieszkalnego rep. C (Dz.1.1.1. w. 16 rubr. 3)
              <table>
                  <tr>
                      <td class=" wciecie">- z orzeczeniem prawa do lokalu socjalnego </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.c!2!4')">
                          <asp:Label ID="tab_1_1_c_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- bez prawa do lokalu socjalnego</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.c!2!4')">
                          <asp:Label ID="tab_1_1_c_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- bez orzeczenia o prawie do lokalu socjalnego </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center ">&nbsp;</td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.d" class="page-break">
            <strong>Dział 1.1.d</strong> O opróżnienie lokalu mieszkalnego w wyniku zmiany orzeczenia przez sąd odwoławczy rep. Ca Dz.1.1.2. (w.05 rubr. 5)

              <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp; - z orzeczeniem prawa do lokalu socjalnego</td>
                    <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!1!4')">
                        <asp:Label ID="tab_1_1_d_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td>&nbsp; - bez prawa do lokalu socjalnego</td>
                    <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!1!4')">
                        <asp:Label ID="tab_1_1_d_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td>&nbsp;- bez orzeczenia o prawie do lokalu socjalnego</td>
                    <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!1!4')">
                        <asp:Label ID="tab_1_1_d_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <br />

        <div id="1.1.e" class="page-break">
            <strong>Dział 1.1.e</strong> Orzeczono ubezwłasnowolnienie (rep.Ns)( Dz.1.1.1 .w. 130 rubr. 4):

              <table>
                  <tr>
                      <td class="wciecie ">całkowite&nbsp;&nbsp; </td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.e!1!4')">
                          <asp:Label ID="tab_1_1_e_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_180">cześciowe</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.e!2!4')">&nbsp;<asp:Label ID="tab_1_1_e_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie" colspan="5">- liczba wniosków o ubezwłasnowolnienie złożonych przez: </td>
                  </tr>
                  <tr>
                      <td class=" wciecie">małżonka osoby, której dotyczy wniosek</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.e!1!4')">
                          <asp:Label ID="tab_1_1_e_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="wciecie">jej krewnych w linii prostej oraz rodzeństwo</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.e!2!4')">
                          <asp:Label ID="tab_1_1_e_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="wciecie">jej przedstawiciela ustawowego</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.e!3!4')">
                          <asp:Label ID="tab_1_1_e_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- oddanie pod obserwację w zakładzie leczniczym ogółem</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.e!1!4')">
                          <asp:Label ID="tab_1_1_e_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="wciecie">do 1 mies.</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.e!2!4')">
                          <asp:Label ID="tab_1_1_e_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="wciecie">pow. 1 do 3 mies.</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.e!3!4')">
                          <asp:Label ID="tab_1_1_e_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="wciecie">ponad 3 mies.</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.e!4!4')">
                          <asp:Label ID="tab_1_1_e_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- ustanowienie doradcy tymczasowego </td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.e!1!4')">
                          <asp:Label ID="tab_1_1_e_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <asp:PlaceHolder runat="server" ID="PlaceHolder1f"></asp:PlaceHolder>

        <br />
        <div id="1.1.i" class="page-break">
            <strong>Dział 1.1.i</strong> Zażalenia w ramach właściwości poziomej
              <table>
                  <tr>
                      <td class="center borderAll" colspan="2">Zażalenia rozpoznane w trybie art. 394<sup>2</sup>§1 kpc w sprawach:</td>
                      <td class="center borderAll">Pozostało z ubiegłego roku</td>
                      <td class="center borderAll">Wpłynęło </td>
                      <td class="center borderAll">Załatwiono </td>
                      <td class="center borderAll">Pozostało na okres następny</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Razem (w02+03)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ca</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Cz</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.j" class="page-break">
            <strong>Dział 1.1.j</strong> (skarga kasacyjna) (Dział 1.1.2.  wiersz 195 kolumna 3 lit. j)
              <table>
                  <tr>
                      <td class="center borderAll" colspan="3">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przekazanych Sądowi Najwyższemu ze skargą kasacyjną w okresie sprawozdawczym</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w. 02 = w. 03 do 09)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="7">w których
                          <br />
                          Sąd Najwyższy</td>
                      <td class="borderAll wciecie">odmówił przyjęcia skargi do rozpoznania (art. 398<sup>9</sup> kpc)</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">odrzucił skargę</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">oddalił skargę (art.398<sup>14</sup> kpc)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uwzględnił skargę poprzez zmianę orzeczenia (art.398<sup>16</sup> kpc)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uchylił orzeczenie i przekazał sprawę sądowi I lub II instancji do ponownego rozpoznania (art.398<sup>15</sup> kpc)</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uchylił wydane orzeczenie i odrzucił pozew (art.398<sup>19</sup> kpc)</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">załatwił w inny sposób</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <br />
        <div id="1.1.k" class="page-break">
            <strong>Dział 1.1.k</strong> Ustanowienie pełnomocnika z urzędu
              <table>
                  <tr>
                      <td class="center borderAll" colspan="2">Repertorium lub wykaz</td>
                      <td class="center borderAll">Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat) </td>
                      <td class="center borderAll">Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat) </td>
                      <td class="center borderAll">W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">C</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ns</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ca</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.l.1" class="page-break">
            <strong>Dział 1.1.l.1</strong> Sprawy mediacyjne
              <table>
                  <tr>
                      <td class="center borderAll" colspan="5" rowspan="2">Sądowe</td>
                      <td class="center borderAll" colspan="2">Sprawy w I instancji</td>
                      <td class="center borderAll">Sprawy w II instancji</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem</td>
                      <td class="center borderAll">w tym o rozwód i separację</td>
                      <td class="center borderAll">razem</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="5">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">wpływ</td>
                      <td class="borderAll wciecie" rowspan="5">Liczba</td>
                      <td class="borderAll wciecie" rowspan="3">spraw w których</td>
                      <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 <sup>8</sup> § 4 kpc)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 <sup>8</sup> § 1 kpc)</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja)</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 <sup>13</sup> § 2 kpc)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">Rozstrzygnięcie przed</td>
                      <td class="borderAll wciecie" rowspan="3">mediatorem</td>
                      <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 <sup>8 </sup>§ 1 kpc) - liczba </td>
                      <td class="borderAll wciecie">ugód zawartych przed mediatorem</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">sądem</td>
                      <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc) </td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="5">Pozasądowe w I instancji</td>
                      <td class="center borderAll" colspan="3">Liczba</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">wpływ</td>
                      <td class="borderAll wciecie" colspan="3">liczba wniosków o zatwierdzenie ugody złożonych przez stronę</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 <sup>13</sup> § 1 kpc)</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="3">Rozstrzygnięcie </td>
                      <td class="borderAll wciecie" colspan="3">zatwierdzono ugodę</td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">nadano klauzulę wykonalności (art. 183 <sup>14</sup> § 2 kpc)</td>
                      <td class="borderAll col_36">17</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                      <td class="borderAll col_36">18</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.l.2" class="page-break">
            <strong>Dział 1.1.l.2</strong> Sprawy mediacyjne w sprawach o rozwód i separację
              <table>
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="5">Sprawy</td>
                      <td class="center borderAll" colspan="12">Postępowanie sądowe</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="4">Pozostało z ubiegłego roku</td>
                      <td class="center borderAll" colspan="4">wpłynęło</td>
                      <td class="center borderAll" colspan="6">załatwiono w postępowaniu mediacyjnym</td>
                      <td class="center borderAll" rowspan="4">pozostało na okres następny</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="3">razem</td>
                      <td class="center borderAll" colspan="3">w tym</td>
                      <td class="center borderAll" rowspan="3">razem</td>
                      <td class="center borderAll" colspan="2" rowspan="2">wynik postępowania mediacyjnego</td>
                      <td class="center borderAll" rowspan="3">liczba porozumień rodzicie-lskich</td>
                      <td class="center borderAll" rowspan="3">umorzono postępo-wanie w wyniku pojednania </td>
                      <td class="center borderAll" rowspan="3">w inny sposób (np. odmowa lub cofnięcie zgody, cofnięcie powództwa, śmierć strony itd.)</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">liczba spraw skierowanych na podstawie</td>
                      <td class="center borderAll" rowspan="2">strony wniosły o przed-łużenie mediacji</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">art. 436 § 1 kpc</td>
                      <td class="center borderAll">art. 445² kpc</td>
                      <td class="center borderAll">ugoda</td>
                      <td class="center borderAll">brak ugody</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
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
                      <td class="borderAll wciecie" colspan="2">o rozwód</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">o separację </td>
                      <td class="borderAll wciecie">rep. C procesowe</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">rep. Ns nieprocesowe</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.m" class="page-break">
            <strong>Dział 1.1.m</strong> Wpływ skarg o wznowienie postępowania
              <table>
                  <tr>
                      <td class="center borderAll" colspan="2">Repertorium lub wykaz</td>
                      <td class="center borderAll">Wpływ spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">C</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ns</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nc</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.n</strong> Sprawy, w których doszło do nabycia nieruchomości przez cudzoziemców na podstawie prawomocnego orzeczenia sądowego [art.8a ust. 2 ustawy z dnia 24 marca 1920 r. o nabywaniu nieru-chomości przez cudzoziemców (Dz. U. z 2017 r. poz. 2278 )]– załatwienia (dotyczy wszystkich urządzeń ewidencyjnych)</td>
                <td class="col_60 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.n!1!4')">
                    <asp:Label ID="tab_1_1_n_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                </a></td>
            </tr>
        </table>
        UWAGA : w każdej sprawie, w której zapadło prawomocne orzeczenie o nabyciu ( zarówno w postępowaniu procesowym jak i nieprocesowym) nieruchomości przez cudzoziemca przesyła się niezwłocznie odpis orzeczenia do MSW. Przez nabycie należy rozumieć każdy rodzaj orzeczenia, na podstawie którego cudzoziemiec stał się właścicielem nieruchomości, np. w trybie zniesienia współwłasności, działu spadku, podziału majątku, zasiedzenia, ustalenia własności, uzgodnienia treści księgi wieczystej itd.<br />
        &nbsp;<br />
        <div id='1.1.o' class="page-break">
            <asp:PlaceHolder runat="server" ID="TablePlaceHolder5"></asp:PlaceHolder>
        </div>

        <br />

        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.p</strong> Liczba wyznaczonych ławników (osoby)</td>
                <td class="borderAll center col_90">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.p!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_p_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
            </tr>
        </table>
        <br />

        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.r</strong> W tym liczba spraw w II instancji o alimenty zagranicą (dot. uprawnionego lub zobowiązanego)</td>
                <td class="borderAll center col_90">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.r!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_r_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
            </tr>
        </table>
        <br />
        <div id="1.1.s" class="page-break">
            <strong>Dział 1.1.s</strong> Przyznanie kompensaty (ustawa z 7 lipca 2005 r. o państwowej kompensacie przysługującej ofiarom niektórych czynów zabronionych) (Dz. U. z 2016 r., poz. 325)
              <table>
                  <tr>
                      <td class=" wciecie">- Liczba spraw, w których przyznano kompensatę</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.s!1!4')">
                          <asp:Label ID="tab_1_1_s_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td>Łączna wysokość przyznanych kompensat (zł) (wartość w zaokrągleniu w górę do pełnego złotego)</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.s!2!4')">
                          <asp:Label ID="tab_1_1_s_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.t" class="page-break">
            <strong>Dział 1.1.t</strong> Prawomocne orzeczenia w sprawach o alimenty przy sprawach rozwodowych (sprawy)
              <table>
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="2">ROSZCZENIA ALIMENTACYJNE</td>
                      <td class="center borderAll" rowspan="2">Ogółem<br />
                          &nbsp;(kol. 2 do 5) </td>
                      <td class="center borderAll" colspan="2">Liczba spraw, w których roszczenie w zakresie alimentów uwzględniono w całości, w części i ponad żądanie </td>
                      <td class="center borderAll" rowspan="2">Wysokość zasądzonych alimentów (ogólna kwota w złotych) </td>
                  </tr>
                  <tr>
                      <td class="center borderAll">o zasądzenie pierwszy raz</td>
                      <td class="center borderAll">o zmianę wysokości</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Razem (wiersz 2 do 4)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="3">Zasądzone na rzecz</td>
                      <td class="borderAll wciecie">dzieci (w tym małoletnich)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków i ich dzieci</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.u" class="page-break">
            <strong>Dział 1.1.u</strong> . W tym na podstawie Ustawy z dnia 22 listopada 2013 r. o postępowaniu wobec osób z zaburzeniami psychicznymi stwarzających zagrożenie życia, zdrowia lub wolności seksualnej innych osób (Dz. U. 2014 poz. 24 ze zm.)
              <table>
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Lit. u) (Dział 1.1.1.  wiersz 139 kolumna 2) liczba wniosków o uznanie osoby za stwarzającą zagrożenie</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">Lit. u) (Dział 1.1.1.  wiersz 139 kolumna 3)</td>
                      <td class="borderAll wciecie" rowspan="2">liczba osób wobec których orzeczono</td>
                      <td class="borderAll wciecie">nadzór prewencyjny </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">umieszczenie w Krajowym Ośrodku Zapobiegania Zachowaniom Dyssocjalnym</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.v" class="page-break">
            <strong>Dział 1.1.v</strong> w tym powództwo w następstwie decyzji organu ochrony konkurencji
              <table>
                  <tr>
                      <td class="center borderAll" colspan="2">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Prezesa UOKiK</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Krajowego organu ochrony konkurencji innego państwa członkowskiego UE</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Komisji Europejskiej</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <br />
        <div id="1.1.w" class="page-break">
            <strong>Dział 1.1.w</strong> w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym
              <table>
                  <tr>
                      <td class="center borderAll" colspan="3">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Wpłynęło </td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Załatwiono</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym </td>
                      <td class="borderAll wciecie">uwzględniono w całości lub w części</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">oddalono</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">pozostało</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <div id="1.1.y" class="page-break">
            <strong>Dział 1.1.y</strong> (dz. 1.1.1 w. 56, 57,161,162 i dz. 1.1.2 w. 39 i 40 lit. y) Liczba postępowań sądowych, których stronami są konsumenci (w rozumieniu art. 221 ustawy kodeks cywilny)1 będący kredytobiorcami kredytów hipotecznych waloryzowanych/denominowanych/indeksowanych do walut obcych, oraz banki
              <table>
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ogółem*</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym do franka szwajcarskiego (CHF)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">w tym</td>
                      <td class="borderAll wciecie" rowspan="8">przedmiot
                          <br />
                          postępowania o</td>
                      <td class="borderAll wciecie">zapłatę</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">ustalenie treści stosunku wiążącego strony</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">unieważnienie bankowego tytułu egzekucyjnego</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">inne</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="4">z tego (z w. 01) kredytobiorca jest</td>
                      <td class="borderAll wciecie">pozwanym</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">powodem</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym</td>
                      <td class="borderAll wciecie" colspan="2">(z w. 01) pozwy złożone przez większą grupę osób (co najmniej 10)</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
            1) Art. 221 ustawy kodeks cywilny [Pojęcie konsumenta] Za konsumenta uważa się osobę fizyczną dokonującą z przedsiębiorcą czynności prawnej niezwiązanej bezpośrednio z jej działalnością gospodarczą lub zawodową.
        </div>
        <br />

        <table style="width: 100%;">
            <tr>
                <td><strong>Dział 1.1.z</strong> w tym: - liczba zażaleń na postanowienie o udzielenie zabezpieczenia (art. 33) (dz. 1.1.1. w. 196, k.4)</td>
                <td class="borderAll center col_90">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.z!1!4')">
                        <asp:Label CssClass="normal" ID="tab_1_1_z_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
            </tr>
        </table>
        <br />
      
     
       

        <div id='1.3' class="page-break">
            <strong>Dział 1.3</strong>   Załatwienie spraw przez referendarzy
    <table>
        <tr>
            <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie </td>
            <td class="center borderAll" colspan="7">Liczba spraw załatwionych przez referendarzy</td>
        </tr>
        <tr>
            <td class="center borderAll">ogółem (kol.1=od 2 do 7)</td>
            <td class="center borderAll">rep. C</td>
            <td class="center borderAll">rep. Nc</td>
            <td class="center borderAll">rep. Ns</td>
            <td class="center borderAll">rep. Ns-Rej</td>
            <td class="center borderAll">rep Co</td>
            <td class="center borderAll">Inne</td>
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
            <td class="borderAll wciecie">W przedmiocie zwolnienia od kosztów sądowych i/lub ustanowienia adwokata lub radcy prawnego</td>
            <td class="borderAll col_36">1</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Zwrot pism po bezskutecznym upływie terminu do ich uzupełnienia i opłacenia</td>
            <td class="borderAll col_36">2</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Wydawanie nakazów zapłaty w postępowaniu upominawczym</td>
            <td class="borderAll col_36">3</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w03_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Wydawanie nakazów zapłaty w postępowaniu nakazowym </td>
            <td class="borderAll col_36">4</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w04_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">O nadanie klauzuli wykonalności</td>
            <td class="borderAll col_36">5</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w05_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Umorzenie postepowania upominawczego</td>
            <td class="borderAll col_36">6</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w06_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Zawieszenie postępowania upominawczego w oparciu o art.174§1 pkt 1 i 4 kpc</td>
            <td class="borderAll col_36">7</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w07_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Prawomocne postanowienia w postępowaniu upominawczym o przekazaniu sprawy sądowi równorzędnemu lub niższego rzędu</td>
            <td class="borderAll col_36">8</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w08_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">Inne</td>
            <td class="borderAll col_36">9</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_1_3_w09_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

       
        <br />

        <div id="1.4" class="page-break">
            <asp:PlaceHolder runat="server" ID="TablePlaceHolder2"></asp:PlaceHolder>
        </div>
        <br />

        <br />

        <div id='2.3' class="page-break">
            <strong>Dział 2.3</strong> Czas trwania wszystkich mediacji w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do dnia zakończenia mediacji
    <table>
        <tr>
            <td class="center borderAll" colspan="4">SPRAWY wg repertoriów</td>
            <td class="center borderAll">Razem (kol. 2 do 7)</td>
            <td class="center borderAll">Do 1 miesiąca</td>
            <td class="center borderAll">Powyżej 1 do 2 miesięcy</td>
            <td class="center borderAll">Powyżej 2do 3 miesięcy</td>
            <td class="center borderAll">Powyżej 3do 6 miesięcy</td>
            <td class="center borderAll">Powyżej 6 do 9 miesięcy</td>
            <td class="center borderAll">Ponad 9 miesięcy</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="4">0</td>
            <td class="borderAll center col_110">1</td>
            <td class="borderAll center col_110">2</td>
            <td class="borderAll center col_110">3</td>
            <td class="borderAll center col_110">4</td>
            <td class="borderAll center col_110">5</td>
            <td class="borderAll center col_110">6</td>
            <td class="borderAll center col_110">7</td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="5">SO I instancja</td>
            <td class="borderAll wciecie" colspan="2">C</td>
            <td class="borderAll col_36">1</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="2">w tym spraw o</td>
            <td class="borderAll wciecie">rozwód</td>
            <td class="borderAll col_36">2</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">separację</td>
            <td class="borderAll col_36">3</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w03_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ns –z wył. rejestrowych</td>
            <td class="borderAll col_36">4</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w04_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">w tym spraw o separację</td>
            <td class="borderAll col_36">5</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w05_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="4">SO II<br />
                instancja</td>
            <td class="borderAll wciecie" colspan="2">C</td>
            <td class="borderAll col_36">6</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w06_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ns</td>
            <td class="borderAll col_36">7</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w07_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">RC</td>
            <td class="borderAll col_36">8</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w08_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ca</td>
            <td class="borderAll col_36">9</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_w09_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <br />
        <div id='2.3.1' class="page-break">
            <strong>Dział 2.3.1</strong> Czas trwania mediacji niezakończonych w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do ostatniego dnia okresu sprawozdawczego
    <table>
        <tr>
            <td class="center borderAll" colspan="4">SPRAWY wg repertoriów</td>
            <td class="center borderAll">Razem (kol. 2 do 7)</td>
            <td class="center borderAll">Do 1 miesiąca</td>
            <td class="center borderAll">Powyżej 1 do 2 miesięcy</td>
            <td class="center borderAll">Powyżej 2do 3 miesięcy</td>
            <td class="center borderAll">Powyżej 3do 6 miesięcy</td>
            <td class="center borderAll">Powyżej 6 do 9 miesięcy</td>
            <td class="center borderAll">Ponad 9 miesięcy</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="4">0</td>
            <td class="borderAll center col_110">1</td>
            <td class="borderAll center col_110">2</td>
            <td class="borderAll center col_110">3</td>
            <td class="borderAll center col_110">4</td>
            <td class="borderAll center col_110">5</td>
            <td class="borderAll center col_110">6</td>
            <td class="borderAll center col_110">7</td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="5">SO I instancja</td>
            <td class="borderAll wciecie" colspan="2">C</td>
            <td class="borderAll col_36">1</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="2">w tym spraw o</td>
            <td class="borderAll wciecie">rozwód</td>
            <td class="borderAll col_36">2</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">separację</td>
            <td class="borderAll col_36">3</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ns –z wył. rejestrowych</td>
            <td class="borderAll col_36">4</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">w tym spraw o separację</td>
            <td class="borderAll col_36">5</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="4">SO II<br />
                instancja</td>
            <td class="borderAll wciecie" colspan="2">C</td>
            <td class="borderAll col_36">6</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=6!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ns</td>
            <td class="borderAll col_36">7</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=7!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">RC</td>
            <td class="borderAll col_36">8</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=8!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">Ca</td>
            <td class="borderAll col_36">9</td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="borderAll center col_110"><a href="javascript:openPopup('popup.aspx?sesja=9!2.3.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_2_3_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>
        <br />

        <div id="3" class="page-break">
            <asp:PlaceHolder runat="server" ID="TablePlaceHolder3"></asp:PlaceHolder>
        </div>
        <br />
        <div id="4.1.a" class="page-break">
            <strong>Dział 4.1.a</strong> Wyznaczenie pierwszej rozprawy/posiedzenia spraw (od dnia wpływu/wpisu sprawy, wraz ze sprawami zawieszonymi
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Środki odwoławcze, które zostały przekazane do rozpoznania sądowi II instancji</td>
                    <td class="center borderAll" rowspan="2">Ogółem (kol. 2 do 7)</td>
                    <td class="center borderAll" colspan="6">Z tego od daty orzeczenia sądu okręgowego do daty przekazania do sądu II instancji upłynął okres</td>
                </tr>
                <tr>
                    <td class="center borderAll">do 2 mies.</td>
                    <td class="center borderAll">pow. 2 do 3 mies.</td>
                    <td class="center borderAll">pow. 3 do 6 mies.</td>
                    <td class="center borderAll">pow.6 do 12 miesięcy.</td>
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
                    <td class="borderAll wciecie">Apelacje </td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!1!4')">
                        <asp:Label ID="tab_4_1_a_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!2!4')">
                        <asp:Label ID="tab_4_1_a_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!3!4')">
                        <asp:Label ID="tab_4_1_a_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!4!4')">
                        <asp:Label ID="tab_4_1_a_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!5!4')">
                        <asp:Label ID="tab_4_1_a_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!6!4')">
                        <asp:Label ID="tab_4_1_a_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.a!7!4')">
                        <asp:Label ID="tab_4_1_a_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Zażalenia</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!1!4')">
                        <asp:Label ID="tab_4_1_a_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!2!4')">
                        <asp:Label ID="tab_4_1_a_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!3!4')">
                        <asp:Label ID="tab_4_1_a_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!4!4')">
                        <asp:Label ID="tab_4_1_a_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!5!4')">
                        <asp:Label ID="tab_4_1_a_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!6!4')">
                        <asp:Label ID="tab_4_1_a_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.a!7!4')">
                        <asp:Label ID="tab_4_1_a_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="4.1.b" class="page-break">
            <strong>Dział 4.1.b</strong> Terminowość obiegu międzyinstancyjnego spraw odwoławczych (Ca, Cz)
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Wpłynęło spraw</td>
                    <td class="center borderAll" rowspan="2">Ogółem (kol. 2 do 7)</td>
                    <td class="center borderAll" colspan="6">W terminie</td>
                </tr>
                <tr>
                    <td class="center borderAll">do 2 mies.</td>
                    <td class="center borderAll">pow. 2 do 3 mies.</td>
                    <td class="center borderAll">pow. 3 do 6 mies.</td>
                    <td class="center borderAll">pow.6 do 12 miesięcy.</td>
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
                    <td class="borderAll wciecie">Ca (apelacyjne)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!1!4')">
                        <asp:Label ID="tab_4_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!2!4')">
                        <asp:Label ID="tab_4_1_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!3!4')">
                        <asp:Label ID="tab_4_1_b_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!4!4')">
                        <asp:Label ID="tab_4_1_b_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!5!4')">
                        <asp:Label ID="tab_4_1_b_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!6!4')">
                        <asp:Label ID="tab_4_1_b_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4.1.b!7!4')">
                        <asp:Label ID="tab_4_1_b_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Cz (zażaleniowe)</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!1!4')">
                        <asp:Label ID="tab_4_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!2!4')">
                        <asp:Label ID="tab_4_1_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!3!4')">
                        <asp:Label ID="tab_4_1_b_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!4!4')">
                        <asp:Label ID="tab_4_1_b_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!5!4')">
                        <asp:Label ID="tab_4_1_b_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!6!4')">
                        <asp:Label ID="tab_4_1_b_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4.1.b!7!4')">
                        <asp:Label ID="tab_4_1_b_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="4.2" class="page-break">
            <strong>Dział 4.2</strong> Liczba spraw, w których po wydaniu orzeczenia sądu odwoławczego akta zwrócono sądowi I instancji
              <table style="width: 100 %;">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="2">Rodzaje spraw z repertorium </td>
                      <td class="center borderAll" rowspan="2">Ogółem (kol. 2 do 7)</td>
                      <td class="center borderAll" colspan="6">W terminie</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">do miesiąca</td>
                      <td class="center borderAll">pow. 1 do 2 mies.</td>
                      <td class="center borderAll">pow. 2 do 3 mies.</td>
                      <td class="center borderAll">3 do 6 mies.</td>
                      <td class="center borderAll">pow.6 do 9 mies.</td>
                      <td class="center borderAll">ponad 9 mies.</td>
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
                      <td class="borderAll wciecie">Ca (apelacyjne)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!1!4')">
                          <asp:Label ID="tab_4_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!2!4')">
                          <asp:Label ID="tab_4_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!3!4')">
                          <asp:Label ID="tab_4_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!4!4')">
                          <asp:Label ID="tab_4_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!5!4')">
                          <asp:Label ID="tab_4_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!6!4')">
                          <asp:Label ID="tab_4_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!7!4')">
                          <asp:Label ID="tab_4_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Cz (zażaleniowe)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!1!4')">
                          <asp:Label ID="tab_4_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!2!4')">
                          <asp:Label ID="tab_4_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!3!4')">
                          <asp:Label ID="tab_4_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!4!4')">
                          <asp:Label ID="tab_4_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!5!4')">
                          <asp:Label ID="tab_4_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!6!4')">
                          <asp:Label ID="tab_4_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                      <td class="center borderAll col_130"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!7!4')">
                          <asp:Label ID="tab_4_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                      </a></td>
                  </tr>
              </table>
        </div>
        <br />
        <br />
        <div id='5.1' class="page-break">
            <strong>Dział 5.1</strong> Szczegółowe rozliczenie skargi (wykaz S)
    <table>
        <tr>
            <td class="center borderAll" colspan="4" rowspan="4">Wyszczególnienie</td>
            <td class="center borderAll" rowspan="4">Pozostało z ubiegłego roku</td>
            <td class="center borderAll" rowspan="4">Wpłynęło</td>
            <td class="center borderAll" colspan="6">Załatwiono</td>
            <td class="center borderAll" colspan="4">Pozostało</td>
            <td class="center borderAll" rowspan="4">Ogólna kwota zasądzonych odszko-dowań ( w złotych ) </td>
        </tr>
        <tr>
            <td class="center borderAll" rowspan="3">ogółem</td>
            <td class="center borderAll" colspan="5">w tym</td>
            <td class="center borderAll" rowspan="3">ogółem</td>
            <td class="center borderAll" colspan="3" rowspan="2">w tym od wpływu</td>
        </tr>
        <tr>
            <td class="center borderAll" colspan="2">uwzględniono w całości lub w części</td>
            <td class="center borderAll" rowspan="2">iodda-lono</td>
            <td class="center borderAll" rowspan="2">odrzu-cono </td>
            <td class="center borderAll" rowspan="2">w inny sposób</td>
        </tr>
        <tr>
            <td class="center borderAll">razem</td>
            <td class="center borderAll">w tym przez zasądzenie kwoty pieniężnej</td>
            <td class="center borderAll">do 2 mies.</td>
            <td class="center borderAll">pow. 2 do 4 mies.</td>
            <td class="center borderAll">ponad 4 mies.</td>
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
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w01_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="11">skarga na </td>
            <td class="borderAll wciecie" colspan="2">zbyt odległe wyznaczenie terminu pierwszej rozprawy</td>
            <td class="borderAll col_36">2</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w02_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">długość przerwy (odroczenia) między rozprawami</td>
            <td class="borderAll col_36">3</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w03_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">zwłokę wykonania opinii przez biegłych albo zasięganie przez sędziów kolejnych opinii</td>
            <td class="borderAll col_36">4</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w04_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">nadużywanie zawieszania postępowania</td>
            <td class="borderAll col_36">5</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w05_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">przewlekłość trwania tzw. czynności wstępnych</td>
            <td class="borderAll col_36">6</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w06_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">przewlekłość postępowania międzyinstancyjnego</td>
            <td class="borderAll col_36">7</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w07_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" rowspan="2">przewlekłość postępowania wykonawczego</td>
            <td class="borderAll wciecie">sądu</td>
            <td class="borderAll col_36">8</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w08_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie">komornika</td>
            <td class="borderAll col_36">9</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w09_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">bezczynność w podejmowaniu czynności procesowych</td>
            <td class="borderAll col_36">10</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!1!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!2!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!3!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!4!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!5!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!6!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!7!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!8!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c08" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!9!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c09" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!10!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c10" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!11!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c11" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!12!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c12" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!5.1!13!4')">
                <asp:Label CssClass="normal" ID="tab_5_1_w10_c13" runat="server" Text="0"></asp:Label></a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">nieterminowość sporządzania uzasadnień</td>
            <td class="borderAll col_36">11</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!1!4')">
                <asp:Label ID="tab_5_1_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!2!4')">
                <asp:Label ID="tab_5_1_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!3!4')">
                <asp:Label ID="tab_5_1_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!4!4')">
                <asp:Label ID="tab_5_1_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!5!4')">
                <asp:Label ID="tab_5_1_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!6!4')">
                <asp:Label ID="tab_5_1_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!7!4')">
                <asp:Label ID="tab_5_1_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!8!4')">
                <asp:Label ID="tab_5_1_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!9!4')">
                <asp:Label ID="tab_5_1_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!10!4')">
                <asp:Label ID="tab_5_1_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!11!4')">
                <asp:Label ID="tab_5_1_w11_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!12!4')">
                <asp:Label ID="tab_5_1_w11_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!5.1!13!4')">
                <asp:Label ID="tab_5_1_w11_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
        </tr>
        <tr>
            <td class="borderAll wciecie" colspan="2">inne</td>
            <td class="borderAll col_36">12</td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!1!4')">
                <asp:Label ID="tab_5_1_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!2!4')">
                <asp:Label ID="tab_5_1_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!3!4')">
                <asp:Label ID="tab_5_1_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!4!4')">
                <asp:Label ID="tab_5_1_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!5!4')">
                <asp:Label ID="tab_5_1_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!6!4')">
                <asp:Label ID="tab_5_1_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!7!4')">
                <asp:Label ID="tab_5_1_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!8!4')">
                <asp:Label ID="tab_5_1_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!9!4')">
                <asp:Label ID="tab_5_1_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!10!4')">
                <asp:Label ID="tab_5_1_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!11!4')">
                <asp:Label ID="tab_5_1_w12_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!12!4')">
                <asp:Label ID="tab_5_1_w12_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
            <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!5.1!13!4')">
                <asp:Label ID="tab_5_1_w12_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
            </a></td>
        </tr>
    </table>
        </div>

        <br />
        <div id="5.2" class="page-break">
            <strong>Dział 5.2</strong> Kontrolka skarg (w wydziale, którego sprawy skarga dotyczy) (§ 4485 ust. 1 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS Nr 5, poz. 22, z późn. zm.)
            <table>
                <tr>
                    <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie</td>
                    <td class="center borderAll" rowspan="2">wpłynęło</td>
                    <td class="center borderAll" rowspan="2">Przesłano do sądu właściwego</td>
                    <td class="center borderAll" colspan="3">Rozpoznanie skargi</td>
                    <td class="center borderAll" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                    <td class="center borderAll" rowspan="2">Kwota (w złotych)</td>
                </tr>
                <tr>
                    <td class="center borderAll">uwzględniono</td>
                    <td class="center borderAll">oddalono</td>
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
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!1!4')">
                        <asp:Label ID="tab_5_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!2!4')">
                        <asp:Label ID="tab_5_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!3!4')">
                        <asp:Label ID="tab_5_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!4!4')">
                        <asp:Label ID="tab_5_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!5!4')">
                        <asp:Label ID="tab_5_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!6!4')">
                        <asp:Label ID="tab_5_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_130 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!7!4')">
                        <asp:Label ID="tab_5_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="6" class="page-break">
            <strong>Dział 6</strong> Prawomocnie zasądzone odszkodowania i zadośćuczynienia (w okresie sprawozdawczym) (rep. C)
            <table>
                <tr>
                    <td class="center borderAll" colspan="5" rowspan="3">Wyszczególnienie rodzajów spraw według wykazu spraw podlegających symbolizacji</td>
                    <td class="center borderAll" colspan="3">Liczba</td>
                    <td class="center borderAll" rowspan="3">Łączna wysokość zasądzonych odszkodowań (zł)</td>
                    <td class="center borderAll" rowspan="3">Łączna wysokość zadośćuczynienia (zł)</td>
                    <td class="center borderAll" colspan="3">Liczba </td>
                    <td class="center borderAll" rowspan="3">Łączna wysokość zasądzonych odszkodowań (zł)</td>
                    <td class="center borderAll" rowspan="3">Łączna wysokość zadośćuczynienia (zł)</td>
                </tr>
                <tr>
                    <td class="center borderAll" rowspan="2">spraw</td>
                    <td class="center borderAll" colspan="2">osób którym zasądzono</td>
                    <td class="center borderAll" rowspan="2">spraw</td>
                    <td class="center borderAll" colspan="2">osób którym zasądzono</td>
                </tr>
                <tr>
                    <td class="center borderAll">odszkodowania </td>
                    <td class="center borderAll">zadośćuczynienia</td>
                    <td class="center borderAll">odszkodowania </td>
                    <td class="center borderAll">zadośćuczynienia</td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="5">0</td>
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
                    <td class="borderAll wciecie" colspan="3" rowspan="2">Ogółem (w.01=w.02 do 27)</td>
                    <td class="borderAll wciecie" rowspan="2">&nbsp;</td>
                    <td class="borderAll col_36" rowspan="2">1</td>
                    <td class="borderAll center" colspan="5">I instancja</td>
                    <td class="borderAll center" colspan="5">II instancja</td>
                </tr>
                <tr>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">
                        <asp:Label ID="tab_6_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!2!4')">
                        <asp:Label ID="tab_6_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!3!4')">
                        <asp:Label ID="tab_6_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!4!4')">
                        <asp:Label ID="tab_6_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!5!4')">
                        <asp:Label ID="tab_6_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!6!4')">
                        <asp:Label ID="tab_6_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!7!4')">
                        <asp:Label ID="tab_6_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!8!4')">
                        <asp:Label ID="tab_6_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!9!4')">
                        <asp:Label ID="tab_6_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6!10!4')">
                        <asp:Label ID="tab_6_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Odszkodowania z tytułu wypadków komunikacyjnych</td>
                    <td class="borderAll wciecie">014wk, 014oc, 014pz</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!1!4')">
                        <asp:Label ID="tab_6_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!2!4')">
                        <asp:Label ID="tab_6_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!3!4')">
                        <asp:Label ID="tab_6_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!4!4')">
                        <asp:Label ID="tab_6_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!5!4')">
                        <asp:Label ID="tab_6_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!6!4')">
                        <asp:Label ID="tab_6_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!7!4')">
                        <asp:Label ID="tab_6_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!8!4')">
                        <asp:Label ID="tab_6_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!9!4')">
                        <asp:Label ID="tab_6_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6!10!4')">
                        <asp:Label ID="tab_6_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Odszkodowania z tytułu odpowiedzialności Skarbu Państwa za szkody wyrządzone przez funkcjonariuszy podległych Ministrowi Edukacji Narodowej</td>
                    <td class="borderAll wciecie">026</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!1!4')">
                        <asp:Label ID="tab_6_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!2!4')">
                        <asp:Label ID="tab_6_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!3!4')">
                        <asp:Label ID="tab_6_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!4!4')">
                        <asp:Label ID="tab_6_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!5!4')">
                        <asp:Label ID="tab_6_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!6!4')">
                        <asp:Label ID="tab_6_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!7!4')">
                        <asp:Label ID="tab_6_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!8!4')">
                        <asp:Label ID="tab_6_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!9!4')">
                        <asp:Label ID="tab_6_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6!10!4')">
                        <asp:Label ID="tab_6_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">&nbsp;</td>
                    <td class="borderAll wciecie" colspan="2">samodzielnemu (posiadającemu osobowość prawną) publicznemu zakładowi opieki zdrowotnej</td>
                    <td class="borderAll wciecie">027</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!1!4')">
                        <asp:Label ID="tab_6_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!2!4')">
                        <asp:Label ID="tab_6_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!3!4')">
                        <asp:Label ID="tab_6_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!4!4')">
                        <asp:Label ID="tab_6_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!5!4')">
                        <asp:Label ID="tab_6_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!6!4')">
                        <asp:Label ID="tab_6_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!7!4')">
                        <asp:Label ID="tab_6_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!8!4')">
                        <asp:Label ID="tab_6_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!9!4')">
                        <asp:Label ID="tab_6_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6!10!4')">
                        <asp:Label ID="tab_6_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Skarbowi Państwa lub jednostce samorządu terytorialnego, w związku ze szkodą zaistniałą w niesamodzielnym publicznym zakładzie służby zdrowia (w tym także przed 1 stycznia 1999 r.)</td>
                    <td class="borderAll wciecie">027a</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!1!4')">
                        <asp:Label ID="tab_6_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!2!4')">
                        <asp:Label ID="tab_6_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!3!4')">
                        <asp:Label ID="tab_6_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!4!4')">
                        <asp:Label ID="tab_6_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!5!4')">
                        <asp:Label ID="tab_6_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!6!4')">
                        <asp:Label ID="tab_6_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!7!4')">
                        <asp:Label ID="tab_6_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!8!4')">
                        <asp:Label ID="tab_6_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!9!4')">
                        <asp:Label ID="tab_6_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6!10!4')">
                        <asp:Label ID="tab_6_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">niepublicznym (prywatnym i spółdzielczym) zakładom służby zdrowia (bez względu na ich formę organizacyjną)</td>
                    <td class="borderAll wciecie">027b</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!1!4')">
                        <asp:Label ID="tab_6_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!2!4')">
                        <asp:Label ID="tab_6_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!3!4')">
                        <asp:Label ID="tab_6_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!4!4')">
                        <asp:Label ID="tab_6_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!5!4')">
                        <asp:Label ID="tab_6_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!6!4')">
                        <asp:Label ID="tab_6_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!7!4')">
                        <asp:Label ID="tab_6_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!8!4')">
                        <asp:Label ID="tab_6_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!9!4')">
                        <asp:Label ID="tab_6_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6!10!4')">
                        <asp:Label ID="tab_6_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">Odszkodowania z tytułu odpowiedzialności Skarbu Państwa za szkody wyrządzone przez funkcjonariuszy</td>
                    <td class="borderAll wciecie" rowspan="2">podległych Ministrowi Sprawiedliwości</td>
                    <td class="borderAll wciecie">zakładów karnych</td>
                    <td class="borderAll wciecie">028</td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!1!4')">
                        <asp:Label ID="tab_6_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!2!4')">
                        <asp:Label ID="tab_6_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!3!4')">
                        <asp:Label ID="tab_6_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!4!4')">
                        <asp:Label ID="tab_6_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!5!4')">
                        <asp:Label ID="tab_6_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!6!4')">
                        <asp:Label ID="tab_6_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!7!4')">
                        <asp:Label ID="tab_6_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!8!4')">
                        <asp:Label ID="tab_6_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!9!4')">
                        <asp:Label ID="tab_6_w07_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6!10!4')">
                        <asp:Label ID="tab_6_w07_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">innych</td>
                    <td class="borderAll wciecie">029</td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!1!4')">
                        <asp:Label ID="tab_6_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!2!4')">
                        <asp:Label ID="tab_6_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!3!4')">
                        <asp:Label ID="tab_6_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!4!4')">
                        <asp:Label ID="tab_6_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!5!4')">
                        <asp:Label ID="tab_6_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!6!4')">
                        <asp:Label ID="tab_6_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!7!4')">
                        <asp:Label ID="tab_6_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!8!4')">
                        <asp:Label ID="tab_6_w08_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!9!4')">
                        <asp:Label ID="tab_6_w08_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6!10!4')">
                        <asp:Label ID="tab_6_w08_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">innych resortów</td>
                    <td class="borderAll wciecie">030</td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!1!4')">
                        <asp:Label ID="tab_6_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!2!4')">
                        <asp:Label ID="tab_6_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!3!4')">
                        <asp:Label ID="tab_6_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!4!4')">
                        <asp:Label ID="tab_6_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!5!4')">
                        <asp:Label ID="tab_6_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!6!4')">
                        <asp:Label ID="tab_6_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!7!4')">
                        <asp:Label ID="tab_6_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!8!4')">
                        <asp:Label ID="tab_6_w09_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!9!4')">
                        <asp:Label ID="tab_6_w09_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6!10!4')">
                        <asp:Label ID="tab_6_w09_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">Odpowiedzialność za szkodę wyrządzoną przez niezgodne z prawem działanie lub zaniechanie przy wykonywaniu władzy publicznej (art. 417 §1 kc)</td>
                    <td class="borderAll wciecie" colspan="2">Skarbu Państwa</td>
                    <td class="borderAll wciecie">050</td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!1!4')">
                        <asp:Label ID="tab_6_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!2!4')">
                        <asp:Label ID="tab_6_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!3!4')">
                        <asp:Label ID="tab_6_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!4!4')">
                        <asp:Label ID="tab_6_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!5!4')">
                        <asp:Label ID="tab_6_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!6!4')">
                        <asp:Label ID="tab_6_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!7!4')">
                        <asp:Label ID="tab_6_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!8!4')">
                        <asp:Label ID="tab_6_w10_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!9!4')">
                        <asp:Label ID="tab_6_w10_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6!10!4')">
                        <asp:Label ID="tab_6_w10_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">jednostki samorządu terytorialnego</td>
                    <td class="borderAll wciecie">060</td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!1!4')">
                        <asp:Label ID="tab_6_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!2!4')">
                        <asp:Label ID="tab_6_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!3!4')">
                        <asp:Label ID="tab_6_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!4!4')">
                        <asp:Label ID="tab_6_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!5!4')">
                        <asp:Label ID="tab_6_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!6!4')">
                        <asp:Label ID="tab_6_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!7!4')">
                        <asp:Label ID="tab_6_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!8!4')">
                        <asp:Label ID="tab_6_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!9!4')">
                        <asp:Label ID="tab_6_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6!10!4')">
                        <asp:Label ID="tab_6_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">inne osoby prawne</td>
                    <td class="borderAll wciecie">060a</td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!1!4')">
                        <asp:Label ID="tab_6_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!2!4')">
                        <asp:Label ID="tab_6_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!3!4')">
                        <asp:Label ID="tab_6_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!4!4')">
                        <asp:Label ID="tab_6_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!5!4')">
                        <asp:Label ID="tab_6_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!6!4')">
                        <asp:Label ID="tab_6_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!7!4')">
                        <asp:Label ID="tab_6_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!8!4')">
                        <asp:Label ID="tab_6_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!9!4')">
                        <asp:Label ID="tab_6_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6!10!4')">
                        <asp:Label ID="tab_6_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">Solidarna odpowiedzialność na podstawie porozumienia za wykonywanie zadań z zakresu władzy publicznej (art. 417 §2 kc)</td>
                    <td class="borderAll wciecie" colspan="2">Skarbu Państwa</td>
                    <td class="borderAll wciecie">061</td>
                    <td class="borderAll col_36">13</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!1!4')">
                        <asp:Label ID="tab_6_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!2!4')">
                        <asp:Label ID="tab_6_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!3!4')">
                        <asp:Label ID="tab_6_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!4!4')">
                        <asp:Label ID="tab_6_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!5!4')">
                        <asp:Label ID="tab_6_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!6!4')">
                        <asp:Label ID="tab_6_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!7!4')">
                        <asp:Label ID="tab_6_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!8!4')">
                        <asp:Label ID="tab_6_w13_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!9!4')">
                        <asp:Label ID="tab_6_w13_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6!10!4')">
                        <asp:Label ID="tab_6_w13_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">jednostki samorządu terytorialnego</td>
                    <td class="borderAll wciecie">062</td>
                    <td class="borderAll col_36">14</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!1!4')">
                        <asp:Label ID="tab_6_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!2!4')">
                        <asp:Label ID="tab_6_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!3!4')">
                        <asp:Label ID="tab_6_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!4!4')">
                        <asp:Label ID="tab_6_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!5!4')">
                        <asp:Label ID="tab_6_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!6!4')">
                        <asp:Label ID="tab_6_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!7!4')">
                        <asp:Label ID="tab_6_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!8!4')">
                        <asp:Label ID="tab_6_w14_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!9!4')">
                        <asp:Label ID="tab_6_w14_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6!10!4')">
                        <asp:Label ID="tab_6_w14_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">inne osoby prawne</td>
                    <td class="borderAll wciecie">062a</td>
                    <td class="borderAll col_36">15</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!1!4')">
                        <asp:Label ID="tab_6_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!2!4')">
                        <asp:Label ID="tab_6_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!3!4')">
                        <asp:Label ID="tab_6_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!4!4')">
                        <asp:Label ID="tab_6_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!5!4')">
                        <asp:Label ID="tab_6_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!6!4')">
                        <asp:Label ID="tab_6_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!7!4')">
                        <asp:Label ID="tab_6_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!8!4')">
                        <asp:Label ID="tab_6_w15_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!9!4')">
                        <asp:Label ID="tab_6_w15_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6!10!4')">
                        <asp:Label ID="tab_6_w15_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Odszkodowania za szkodę na osobie </td>
                    <td class="borderAll wciecie">055</td>
                    <td class="borderAll col_36">16</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!1!4')">
                        <asp:Label ID="tab_6_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!2!4')">
                        <asp:Label ID="tab_6_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!3!4')">
                        <asp:Label ID="tab_6_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!4!4')">
                        <asp:Label ID="tab_6_w16_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!5!4')">
                        <asp:Label ID="tab_6_w16_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!6!4')">
                        <asp:Label ID="tab_6_w16_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!7!4')">
                        <asp:Label ID="tab_6_w16_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!8!4')">
                        <asp:Label ID="tab_6_w16_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!9!4')">
                        <asp:Label ID="tab_6_w16_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6!10!4')">
                        <asp:Label ID="tab_6_w16_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">Odszkodowanie za naruszenie dóbr osobistych na podstawie art. 448 kc</td>
                    <td class="borderAll wciecie" colspan="2">zadośćuczynienie za doznaną krzywdę</td>
                    <td class="borderAll wciecie">056</td>
                    <td class="borderAll col_36">17</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!1!4')">
                        <asp:Label ID="tab_6_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!2!4')">
                        <asp:Label ID="tab_6_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!3!4')">
                        <asp:Label ID="tab_6_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!4!4')">
                        <asp:Label ID="tab_6_w17_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!5!4')">
                        <asp:Label ID="tab_6_w17_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!6!4')">
                        <asp:Label ID="tab_6_w17_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!7!4')">
                        <asp:Label ID="tab_6_w17_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!8!4')">
                        <asp:Label ID="tab_6_w17_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!9!4')">
                        <asp:Label ID="tab_6_w17_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6!10!4')">
                        <asp:Label ID="tab_6_w17_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">suma pieniężna na cel społeczny</td>
                    <td class="borderAll wciecie">056s</td>
                    <td class="borderAll col_36">18</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!1!4')">
                        <asp:Label ID="tab_6_w18_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!2!4')">
                        <asp:Label ID="tab_6_w18_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!3!4')">
                        <asp:Label ID="tab_6_w18_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!4!4')">
                        <asp:Label ID="tab_6_w18_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!5!4')">
                        <asp:Label ID="tab_6_w18_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!6!4')">
                        <asp:Label ID="tab_6_w18_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!7!4')">
                        <asp:Label ID="tab_6_w18_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!8!4')">
                        <asp:Label ID="tab_6_w18_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!9!4')">
                        <asp:Label ID="tab_6_w18_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6!10!4')">
                        <asp:Label ID="tab_6_w18_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">Odszkodowania za naruszenie zasady równego traktowania (art. 13 ustawy z dnia 3 grudnia 2010 r. o wdrożeniu niektórych przepisów UE w zakresie równego traktowania (Dz. U. z 2016 r., poz. 1219)</td>
                    <td class="borderAll wciecie" colspan="2">zadośćuczynienie za doznaną krzywdę</td>
                    <td class="borderAll wciecie">056rtz</td>
                    <td class="borderAll col_36">19</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!1!4')">
                        <asp:Label ID="tab_6_w19_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!2!4')">
                        <asp:Label ID="tab_6_w19_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!3!4')">
                        <asp:Label ID="tab_6_w19_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!4!4')">
                        <asp:Label ID="tab_6_w19_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!5!4')">
                        <asp:Label ID="tab_6_w19_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!6!4')">
                        <asp:Label ID="tab_6_w19_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!7!4')">
                        <asp:Label ID="tab_6_w19_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!8!4')">
                        <asp:Label ID="tab_6_w19_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!9!4')">
                        <asp:Label ID="tab_6_w19_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!6!10!4')">
                        <asp:Label ID="tab_6_w19_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">na cel społeczny</td>
                    <td class="borderAll wciecie">056rts</td>
                    <td class="borderAll col_36">20</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!1!4')">
                        <asp:Label ID="tab_6_w20_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!2!4')">
                        <asp:Label ID="tab_6_w20_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!3!4')">
                        <asp:Label ID="tab_6_w20_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!4!4')">
                        <asp:Label ID="tab_6_w20_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!5!4')">
                        <asp:Label ID="tab_6_w20_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!6!4')">
                        <asp:Label ID="tab_6_w20_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!7!4')">
                        <asp:Label ID="tab_6_w20_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!8!4')">
                        <asp:Label ID="tab_6_w20_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!9!4')">
                        <asp:Label ID="tab_6_w20_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!6!10!4')">
                        <asp:Label ID="tab_6_w20_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Bezpodstawne wzbogacenie (art. 405 kc)</td>
                    <td class="borderAll wciecie">057</td>
                    <td class="borderAll col_36">21</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!1!4')">
                        <asp:Label ID="tab_6_w21_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!2!4')">
                        <asp:Label ID="tab_6_w21_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!3!4')">
                        <asp:Label ID="tab_6_w21_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!4!4')">
                        <asp:Label ID="tab_6_w21_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!5!4')">
                        <asp:Label ID="tab_6_w21_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!6!4')">
                        <asp:Label ID="tab_6_w21_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!7!4')">
                        <asp:Label ID="tab_6_w21_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!8!4')">
                        <asp:Label ID="tab_6_w21_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!9!4')">
                        <asp:Label ID="tab_6_w21_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!6!10!4')">
                        <asp:Label ID="tab_6_w21_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Roszczenie o przywrócenie stanu zgodnego z prawem i o zaniechanie naruszeń (art. 222 §2 kc)</td>
                    <td class="borderAll wciecie">058</td>
                    <td class="borderAll col_36">22</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!1!4')">
                        <asp:Label ID="tab_6_w22_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!2!4')">
                        <asp:Label ID="tab_6_w22_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!3!4')">
                        <asp:Label ID="tab_6_w22_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!4!4')">
                        <asp:Label ID="tab_6_w22_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!5!4')">
                        <asp:Label ID="tab_6_w22_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!6!4')">
                        <asp:Label ID="tab_6_w22_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!7!4')">
                        <asp:Label ID="tab_6_w22_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!8!4')">
                        <asp:Label ID="tab_6_w22_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!9!4')">
                        <asp:Label ID="tab_6_w22_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!6!10!4')">
                        <asp:Label ID="tab_6_w22_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Żądanie naprawienia szkody wyrządzonej na osobie przez zgodne z prawem wykonywanie władzy publicznej, gdy okoliczności wskazują, że wymagają tego względy słuszności (art. 417<sup>2</sup> kc)</td>
                    <td class="borderAll wciecie">068</td>
                    <td class="borderAll col_36">23</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!1!4')">
                        <asp:Label ID="tab_6_w23_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!2!4')">
                        <asp:Label ID="tab_6_w23_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!3!4')">
                        <asp:Label ID="tab_6_w23_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!4!4')">
                        <asp:Label ID="tab_6_w23_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!5!4')">
                        <asp:Label ID="tab_6_w23_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!6!4')">
                        <asp:Label ID="tab_6_w23_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!7!4')">
                        <asp:Label ID="tab_6_w23_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!8!4')">
                        <asp:Label ID="tab_6_w23_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!9!4')">
                        <asp:Label ID="tab_6_w23_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!6!10!4')">
                        <asp:Label ID="tab_6_w23_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Żądanie zadośćuczynienia pieniężnego za szkody wyrządzone na osobie przez zgodne z prawem wykonywanie władzy publicznej, gdy okoliczności wskazują, że wymagają tego względy słuszności (art. 417<sup>2</sup> kc) </td>
                    <td class="borderAll wciecie">069</td>
                    <td class="borderAll col_36">24</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!1!4')">
                        <asp:Label ID="tab_6_w24_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!2!4')">
                        <asp:Label ID="tab_6_w24_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!3!4')">
                        <asp:Label ID="tab_6_w24_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!4!4')">
                        <asp:Label ID="tab_6_w24_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!5!4')">
                        <asp:Label ID="tab_6_w24_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!6!4')">
                        <asp:Label ID="tab_6_w24_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!7!4')">
                        <asp:Label ID="tab_6_w24_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!8!4')">
                        <asp:Label ID="tab_6_w24_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!9!4')">
                        <asp:Label ID="tab_6_w24_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!6!10!4')">
                        <asp:Label ID="tab_6_w24_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Odpowiedzialność za wydanie aktu normatywnego niezgodnego z Konstytucją, ratyfikowaną umową międzynarodową lub ustawą oraz za niewydanie aktu normatywnego, którego obowiązek wydania przewiduje przepis prawa (art. 4171 §1 i 4 kc) </td>
                    <td class="borderAll wciecie">063</td>
                    <td class="borderAll col_36">25</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!1!4')">
                        <asp:Label ID="tab_6_w25_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!2!4')">
                        <asp:Label ID="tab_6_w25_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!3!4')">
                        <asp:Label ID="tab_6_w25_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!4!4')">
                        <asp:Label ID="tab_6_w25_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!5!4')">
                        <asp:Label ID="tab_6_w25_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!6!4')">
                        <asp:Label ID="tab_6_w25_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!7!4')">
                        <asp:Label ID="tab_6_w25_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!8!4')">
                        <asp:Label ID="tab_6_w25_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!9!4')">
                        <asp:Label ID="tab_6_w25_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!6!10!4')">
                        <asp:Label ID="tab_6_w25_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Odpowiedzialność za wydanie prawomocnego orzeczenia lub ostatecznej decyzji oraz za niewydanie orzeczenia lub decyzji gdy obowiązek ich wydania przewiduje przepis prawa (art. 4171 §2 i 3 kc) </td>
                    <td class="borderAll wciecie">064</td>
                    <td class="borderAll col_36">26</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!1!4')">
                        <asp:Label ID="tab_6_w26_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!2!4')">
                        <asp:Label ID="tab_6_w26_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!3!4')">
                        <asp:Label ID="tab_6_w26_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!4!4')">
                        <asp:Label ID="tab_6_w26_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!5!4')">
                        <asp:Label ID="tab_6_w26_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!6!4')">
                        <asp:Label ID="tab_6_w26_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!7!4')">
                        <asp:Label ID="tab_6_w26_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!8!4')">
                        <asp:Label ID="tab_6_w26_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!9!4')">
                        <asp:Label ID="tab_6_w26_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!6!10!4')">
                        <asp:Label ID="tab_6_w26_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="3">Inne</td>
                    <td class="borderAll wciecie"></td>
                    <td class="borderAll col_36">27</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!1!4')">
                        <asp:Label ID="tab_6_w27_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!2!4')">
                        <asp:Label ID="tab_6_w27_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!3!4')">
                        <asp:Label ID="tab_6_w27_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!4!4')">
                        <asp:Label ID="tab_6_w27_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!5!4')">
                        <asp:Label ID="tab_6_w27_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!6!4')">
                        <asp:Label ID="tab_6_w27_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!7!4')">
                        <asp:Label ID="tab_6_w27_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!8!4')">
                        <asp:Label ID="tab_6_w27_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!9!4')">
                        <asp:Label ID="tab_6_w27_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!6!10!4')">
                        <asp:Label ID="tab_6_w27_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="7" class="page-break">
            <strong>Dział 7</strong> Sprawy cywilne wielotomowe
            <table>
                <tr>
                    <td class="center borderAll" colspan="4" rowspan="2">SPRAWY z rep.</td>
                    <td class="center borderAll" colspan="7">Sprawy cywilne wielotomowe - liczba spraw</td>
                </tr>
                <tr>
                    <td class="center borderAll">zbiorczo pow. 5 tomów (kol.2 do 7)</td>
                    <td class="center borderAll">pow. 5 do 10 tomów</td>
                    <td class="center borderAll">pow. 10 do 20 tomów</td>
                    <td class="center borderAll">pow. 20 do 30 tomów</td>
                    <td class="center borderAll">pow. 30 do 50 tomów</td>
                    <td class="center borderAll">pow. 50 do 100 tomów </td>
                    <td class="center borderAll">powyżej 100 tomów </td>
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
                    <td class="borderAll wciecie" rowspan="9">C</td>
                    <td class="borderAll wciecie" colspan="2">Pozostało z poprzedniego okresu</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!4')">
                        <asp:Label ID="tab_7_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!4')">
                        <asp:Label ID="tab_7_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!4')">
                        <asp:Label ID="tab_7_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!4')">
                        <asp:Label ID="tab_7_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!4')">
                        <asp:Label ID="tab_7_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!4')">
                        <asp:Label ID="tab_7_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!4')">
                        <asp:Label ID="tab_7_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!1!4')">
                        <asp:Label ID="tab_7_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!4')">
                        <asp:Label ID="tab_7_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!4')">
                        <asp:Label ID="tab_7_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!4')">
                        <asp:Label ID="tab_7_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!4')">
                        <asp:Label ID="tab_7_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!4')">
                        <asp:Label ID="tab_7_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!4')">
                        <asp:Label ID="tab_7_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">w tym</td>
                    <td class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!1!4')">
                        <asp:Label ID="tab_7_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!2!4')">
                        <asp:Label ID="tab_7_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!3!4')">
                        <asp:Label ID="tab_7_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!4!4')">
                        <asp:Label ID="tab_7_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!5!4')">
                        <asp:Label ID="tab_7_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!6!4')">
                        <asp:Label ID="tab_7_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7!7!4')">
                        <asp:Label ID="tab_7_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w wyniku zwrotu pozwu</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!1!4')">
                        <asp:Label ID="tab_7_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!2!4')">
                        <asp:Label ID="tab_7_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!3!4')">
                        <asp:Label ID="tab_7_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!4!4')">
                        <asp:Label ID="tab_7_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!5!4')">
                        <asp:Label ID="tab_7_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!6!4')">
                        <asp:Label ID="tab_7_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!7!7!4')">
                        <asp:Label ID="tab_7_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">wyłączenie sprawy (roszczenia) do odrębnego postępowania</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!1!4')">
                        <asp:Label ID="tab_7_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!2!4')">
                        <asp:Label ID="tab_7_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!3!4')">
                        <asp:Label ID="tab_7_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!4!4')">
                        <asp:Label ID="tab_7_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!5!4')">
                        <asp:Label ID="tab_7_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!6!4')">
                        <asp:Label ID="tab_7_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!7!7!4')">
                        <asp:Label ID="tab_7_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!1!4')">
                        <asp:Label ID="tab_7_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!2!4')">
                        <asp:Label ID="tab_7_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!3!4')">
                        <asp:Label ID="tab_7_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!4!4')">
                        <asp:Label ID="tab_7_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!5!4')">
                        <asp:Label ID="tab_7_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!6!4')">
                        <asp:Label ID="tab_7_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!7!7!4')">
                        <asp:Label ID="tab_7_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="2">w tym</td>
                    <td class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!1!4')">
                        <asp:Label ID="tab_7_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!2!4')">
                        <asp:Label ID="tab_7_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!3!4')">
                        <asp:Label ID="tab_7_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!4!4')">
                        <asp:Label ID="tab_7_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!5!4')">
                        <asp:Label ID="tab_7_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!6!4')">
                        <asp:Label ID="tab_7_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!7!7!4')">
                        <asp:Label ID="tab_7_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">w wyniku zwrotu pozwu</td>
                    <td class="borderAll col_36">8</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!1!4')">
                        <asp:Label ID="tab_7_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!2!4')">
                        <asp:Label ID="tab_7_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!3!4')">
                        <asp:Label ID="tab_7_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!4!4')">
                        <asp:Label ID="tab_7_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!5!4')">
                        <asp:Label ID="tab_7_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!6!4')">
                        <asp:Label ID="tab_7_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!7!7!4')">
                        <asp:Label ID="tab_7_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
                    <td class="borderAll col_36">9</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!1!4')">
                        <asp:Label ID="tab_7_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!2!4')">
                        <asp:Label ID="tab_7_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!3!4')">
                        <asp:Label ID="tab_7_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!4!4')">
                        <asp:Label ID="tab_7_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!5!4')">
                        <asp:Label ID="tab_7_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!6!4')">
                        <asp:Label ID="tab_7_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!7!7!4')">
                        <asp:Label ID="tab_7_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="6">Ca </td>
                    <td class="borderAll wciecie" colspan="2">Pozostało z poprzedniego okresu </td>
                    <td class="borderAll col_36">10</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!1!4')">
                        <asp:Label ID="tab_7_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!2!4')">
                        <asp:Label ID="tab_7_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!3!4')">
                        <asp:Label ID="tab_7_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!4!4')">
                        <asp:Label ID="tab_7_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!5!4')">
                        <asp:Label ID="tab_7_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!6!4')">
                        <asp:Label ID="tab_7_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!7!7!4')">
                        <asp:Label ID="tab_7_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">11</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!1!4')">
                        <asp:Label ID="tab_7_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!2!4')">
                        <asp:Label ID="tab_7_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!3!4')">
                        <asp:Label ID="tab_7_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!4!4')">
                        <asp:Label ID="tab_7_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!5!4')">
                        <asp:Label ID="tab_7_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!6!4')">
                        <asp:Label ID="tab_7_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!7!7!4')">
                        <asp:Label ID="tab_7_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">W tym wpływ w wyniku przekazania z innej jednostki</td>
                    <td class="borderAll col_36">12</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!1!4')">
                        <asp:Label ID="tab_7_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!2!4')">
                        <asp:Label ID="tab_7_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!3!4')">
                        <asp:Label ID="tab_7_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!4!4')">
                        <asp:Label ID="tab_7_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!5!4')">
                        <asp:Label ID="tab_7_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!6!4')">
                        <asp:Label ID="tab_7_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!7!7!4')">
                        <asp:Label ID="tab_7_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym</td>
                    <td class="borderAll col_36">13</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!1!4')">
                        <asp:Label ID="tab_7_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!2!4')">
                        <asp:Label ID="tab_7_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!3!4')">
                        <asp:Label ID="tab_7_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!4!4')">
                        <asp:Label ID="tab_7_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!5!4')">
                        <asp:Label ID="tab_7_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!6!4')">
                        <asp:Label ID="tab_7_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!7!7!4')">
                        <asp:Label ID="tab_7_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym załatwienie w wyniku przekazania do innej jednostki</td>
                    <td class="borderAll col_36">14</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!1!4')">
                        <asp:Label ID="tab_7_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!2!4')">
                        <asp:Label ID="tab_7_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!3!4')">
                        <asp:Label ID="tab_7_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!4!4')">
                        <asp:Label ID="tab_7_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!5!4')">
                        <asp:Label ID="tab_7_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!6!4')">
                        <asp:Label ID="tab_7_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!7!7!4')">
                        <asp:Label ID="tab_7_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
                    <td class="borderAll col_36">15</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!1!4')">
                        <asp:Label ID="tab_7_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!2!4')">
                        <asp:Label ID="tab_7_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!3!4')">
                        <asp:Label ID="tab_7_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!4!4')">
                        <asp:Label ID="tab_7_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!5!4')">
                        <asp:Label ID="tab_7_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!6!4')">
                        <asp:Label ID="tab_7_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!7!7!4')">
                        <asp:Label ID="tab_7_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div id="7.1" class="page-break">
            <strong>Dział 7.1</strong> Obsada Sądu (Wydziału)
            <table>
                <tr>
                    <td class="center borderAll" colspan="2">Wyszczególnienie</td>
                    <td class="center borderAll ">Liczba sędziów SO i wakujących stanowisk sędziowskich w ramach limitu (na ostatni dzień okresu statystycznego)</td>
                    <td class="center borderAll ">Liczba sędziów SO i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="center borderAll ">Obsada średniookresowa (sędziowie SO) z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP oraz sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy wymiarze w SA i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SO czy SR </td>
                    <td class="center borderAll ">Liczba sędziów SO z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości , KSSiP oraz sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy wymiarze w SA i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SO czy SR </td>
                    <td class="center borderAll ">Obsada średniookresowa sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA </td>
                    <td class="center borderAll ">Liczba sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA</td>
                    <td class="center borderAll ">&nbsp;Obsada średniookresowa sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SA </td>
                    <td class="center borderAll ">i Liczba sędziów SO delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SA</td>
                    <td class="center borderAll ">Obsada średniookresowa sędziów SO w ramach limitu delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości </td>
                    <td class="center borderAll ">Liczba sędziów SO delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości </td>
                    <td class="center borderAll ">Obsada średniookresowa sędziów SO w ramach limitu delegowanych do pełnienia czynności w Krajowej Szkole Sądownictwa i Prokuratury </td>
                    <td class="center borderAll ">Liczba sędziów SO delegowanych do pełnienia czynności w Krajowej Szkole Sądownictwa i Prokuratury </td>
                    <td class="center borderAll ">Obsada sędziów SA delegowanych do pełnienia czynności orzeczniczych w pełnym lun niepełnym wymiarze w SO </td>
                    <td class="center borderAll ">Liczba sędziów SA delegowanych do pełnienia czynności orzeczniczych w pełnym lun niepełnym wymiarze w SO </td>
                    <td class="center borderAll ">Obsada sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w SR </td>
                    <td class="center borderAll ">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w SR </td>
                    <td class="center borderAll ">Obsada sędziów SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SR </td>
                    <td class="center borderAll ">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SR </td>
                    <td class="center borderAll ">Obsada sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO </td>
                    <td class="center borderAll ">Liczba sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO </td>
                    <td class="center borderAll ">Obsada sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO</td>
                    <td class="center borderAll ">Liczba sędziów danego SO delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO</td>
                    <td class="center borderAll ">Obsada sędziów innego SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO</td>
                    <td class="center borderAll ">Liczba sędziów innego SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO </td>
                    <td class="center borderAll ">Obsada średniookresowa (sędziowie funkcyjni SO) I wersja </td>
                    <td class="center borderAll ">Obsada średniookresowa (sędziowie funkcyjni SO) II wersja </td>
                    <td class="center borderAll ">Liczba sędziów SO funkcyj-nych te-go sądu</td>
                    <td class="center borderAll ">Liczba sędziów SO funkcyjnych tego sądu Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze) </td>
                    <td class="center borderAll ">Liczba sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze) </td>
                    <td class="center borderAll ">Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) </td>
                    <td class="center borderAll ">Liczba sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) </td>
                    <td class="center borderAll ">Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp) </td>
                    <td class="center borderAll ">&nbsp;Liczba sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp) </td>
                    <td class="center borderAll ">Łączna liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) sędziów SO z wyłączeniem sędziów funkcyjnych sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze, czy też wykonujących czynności orzecznicze na mocy ustawy sędziów SO delegowanych do pełnienia czynności orzeczniczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP</td>
                    <td class="center borderAll ">Średniookresowa liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) jednego sędziego SO z wyłączeniem sędziów funkcyjnych sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy, sędziów SO delegowanych do pełnienia czynności orzeczniczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP </td>
                    <td class="center borderAll ">Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego) </td>
                    <td class="center borderAll ">Liczba obsadzonych etatów (w okresie statystycznym) </td>
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
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">
                        <asp:Label ID="tab_71_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!2!4')">
                        <asp:Label ID="tab_71_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!3!4')">
                        <asp:Label ID="tab_71_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!4!4')">
                        <asp:Label ID="tab_71_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!5!4')">
                        <asp:Label ID="tab_71_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!6!4')">
                        <asp:Label ID="tab_71_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!7!4')">
                        <asp:Label ID="tab_71_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!8!4')">
                        <asp:Label ID="tab_71_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!9!4')">
                        <asp:Label ID="tab_71_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!10!4')">
                        <asp:Label ID="tab_71_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!11!4')">
                        <asp:Label ID="tab_71_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!12!4')">
                        <asp:Label ID="tab_71_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!13!4')">
                        <asp:Label ID="tab_71_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!14!4')">
                        <asp:Label ID="tab_71_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!15!4')">
                        <asp:Label ID="tab_71_w01_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!16!4')">
                        <asp:Label ID="tab_71_w01_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!17!4')">
                        <asp:Label ID="tab_71_w01_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!18!4')">
                        <asp:Label ID="tab_71_w01_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!19!4')">
                        <asp:Label ID="tab_71_w01_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!20!4')">
                        <asp:Label ID="tab_71_w01_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!21!4')">
                        <asp:Label ID="tab_71_w01_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!22!4')">
                        <asp:Label ID="tab_71_w01_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!23!4')">
                        <asp:Label ID="tab_71_w01_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!24!4')">
                        <asp:Label ID="tab_71_w01_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!25!4')">
                        <asp:Label ID="tab_71_w01_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!26!4')">
                        <asp:Label ID="tab_71_w01_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!27!4')">
                        <asp:Label ID="tab_71_w01_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!28!4')">
                        <asp:Label ID="tab_71_w01_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!29!4')">
                        <asp:Label ID="tab_71_w01_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!30!4')">
                        <asp:Label ID="tab_71_w01_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!31!4')">
                        <asp:Label ID="tab_71_w01_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!32!4')">
                        <asp:Label ID="tab_71_w01_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!33!4')">
                        <asp:Label ID="tab_71_w01_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!34!4')">
                        <asp:Label ID="tab_71_w01_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!35!4')">
                        <asp:Label ID="tab_71_w01_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!36!4')">
                        <asp:Label ID="tab_71_w01_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!37!4')">
                        <asp:Label ID="tab_71_w01_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">I instancja</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!1!4')">
                        <asp:Label ID="tab_71_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!2!4')">
                        <asp:Label ID="tab_71_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!3!4')">
                        <asp:Label ID="tab_71_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!4!4')">
                        <asp:Label ID="tab_71_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!5!4')">
                        <asp:Label ID="tab_71_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!6!4')">
                        <asp:Label ID="tab_71_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!7!4')">
                        <asp:Label ID="tab_71_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!8!4')">
                        <asp:Label ID="tab_71_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!9!4')">
                        <asp:Label ID="tab_71_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!10!4')">
                        <asp:Label ID="tab_71_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!11!4')">
                        <asp:Label ID="tab_71_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!12!4')">
                        <asp:Label ID="tab_71_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!13!4')">
                        <asp:Label ID="tab_71_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!14!4')">
                        <asp:Label ID="tab_71_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!15!4')">
                        <asp:Label ID="tab_71_w02_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!16!4')">
                        <asp:Label ID="tab_71_w02_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!17!4')">
                        <asp:Label ID="tab_71_w02_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!18!4')">
                        <asp:Label ID="tab_71_w02_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!19!4')">
                        <asp:Label ID="tab_71_w02_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!20!4')">
                        <asp:Label ID="tab_71_w02_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!21!4')">
                        <asp:Label ID="tab_71_w02_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!22!4')">
                        <asp:Label ID="tab_71_w02_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!23!4')">
                        <asp:Label ID="tab_71_w02_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!24!4')">
                        <asp:Label ID="tab_71_w02_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!25!4')">
                        <asp:Label ID="tab_71_w02_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!26!4')">
                        <asp:Label ID="tab_71_w02_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!27!4')">
                        <asp:Label ID="tab_71_w02_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!28!4')">
                        <asp:Label ID="tab_71_w02_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!29!4')">
                        <asp:Label ID="tab_71_w02_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!30!4')">
                        <asp:Label ID="tab_71_w02_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!31!4')">
                        <asp:Label ID="tab_71_w02_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!32!4')">
                        <asp:Label ID="tab_71_w02_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!33!4')">
                        <asp:Label ID="tab_71_w02_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!34!4')">
                        <asp:Label ID="tab_71_w02_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!35!4')">
                        <asp:Label ID="tab_71_w02_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!36!4')">
                        <asp:Label ID="tab_71_w02_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!37!4')">
                        <asp:Label ID="tab_71_w02_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">II instancja</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!1!4')">
                        <asp:Label ID="tab_71_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!2!4')">
                        <asp:Label ID="tab_71_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!3!4')">
                        <asp:Label ID="tab_71_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!4!4')">
                        <asp:Label ID="tab_71_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!5!4')">
                        <asp:Label ID="tab_71_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!6!4')">
                        <asp:Label ID="tab_71_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!7!4')">
                        <asp:Label ID="tab_71_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!8!4')">
                        <asp:Label ID="tab_71_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!9!4')">
                        <asp:Label ID="tab_71_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!10!4')">
                        <asp:Label ID="tab_71_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!11!4')">
                        <asp:Label ID="tab_71_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!12!4')">
                        <asp:Label ID="tab_71_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!13!4')">
                        <asp:Label ID="tab_71_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!14!4')">
                        <asp:Label ID="tab_71_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!15!4')">
                        <asp:Label ID="tab_71_w03_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!16!4')">
                        <asp:Label ID="tab_71_w03_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!17!4')">
                        <asp:Label ID="tab_71_w03_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!18!4')">
                        <asp:Label ID="tab_71_w03_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!19!4')">
                        <asp:Label ID="tab_71_w03_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!20!4')">
                        <asp:Label ID="tab_71_w03_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!21!4')">
                        <asp:Label ID="tab_71_w03_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!22!4')">
                        <asp:Label ID="tab_71_w03_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!23!4')">
                        <asp:Label ID="tab_71_w03_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!24!4')">
                        <asp:Label ID="tab_71_w03_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!25!4')">
                        <asp:Label ID="tab_71_w03_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!26!4')">
                        <asp:Label ID="tab_71_w03_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!27!4')">
                        <asp:Label ID="tab_71_w03_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!28!4')">
                        <asp:Label ID="tab_71_w03_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!29!4')">
                        <asp:Label ID="tab_71_w03_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!30!4')">
                        <asp:Label ID="tab_71_w03_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!31!4')">
                        <asp:Label ID="tab_71_w03_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!32!4')">
                        <asp:Label ID="tab_71_w03_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!33!4')">
                        <asp:Label ID="tab_71_w03_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!34!4')">
                        <asp:Label ID="tab_71_w03_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!35!4')">
                        <asp:Label ID="tab_71_w03_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!36!4')">
                        <asp:Label ID="tab_71_w03_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!37!4')">
                        <asp:Label ID="tab_71_w03_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="7.2" class="page-break">

            <asp:PlaceHolder runat="server" ID="TablePlaceHolder8"></asp:PlaceHolder>
        </div>
        <br />
        W poniższych działach odnoszących się do biegłych i tłumaczy wykazujemy dane dotyczące opinii i tłumaczeń zleconych po 1 stycznia 2017r.
        <br />
        <br />
        <div id="8.1" class="page-break">
            <strong>Dział 8.1</strong> Liczba biegłych/podmiotów wydających opinie w sprawach (z wył. tłumaczy przysięgłych)
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
                    <td class="borderAll wciecie" colspan="2">Ogółem (w. 02+06)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">I instancja ogółem</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">w t</td>
                    <td class="borderAll wciecie">C</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">CG-G</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Ns</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">II instancja ogółem</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym Ca</td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.1!1!4')">
                        <asp:Label ID="tab_8_1_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.1!2!4')">
                        <asp:Label ID="tab_8_1_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.1!3!4')">
                        <asp:Label ID="tab_8_1_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_150 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.1!4!4')">
                        <asp:Label ID="tab_8_1_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="8.2" class="page-break">
            <strong>Dział 8.2</strong> Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych)
            <table>
                <tr>
                    <td class="center borderAll" colspan="3" rowspan="3">Sprawy wg repertoriów</td>
                    <td class="center borderAll" colspan="8">Liczba sporządzonych opinii </td>
                </tr>
                <tr>
                    <td class="center borderAll" rowspan="2">razem (kol.1= 2 do 5 = 6 do 8)</td>
                    <td class="center borderAll" rowspan="2">w ustalonym terminie</td>
                    <td class="center borderAll" colspan="3">po ustalonym terminie</td>
                    <td class="center borderAll" colspan="3">wg czasu wydania opinii</td>
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
                    <td class="center borderAll" colspan="3">0</td>
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
                    <td class="borderAll wciecie" colspan="2">Ogółem (w. 02+06)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">I instancja ogółem</td>
                    <td class="borderAll col_36">2</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" rowspan="3">w tym</td>
                    <td class="borderAll wciecie">C</td>
                    <td class="borderAll col_36">3</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">CG-G</td>
                    <td class="borderAll col_36">4</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Ns</td>
                    <td class="borderAll col_36">5</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">II instancja ogółem</td>
                    <td class="borderAll col_36">6</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">w tym Ca</td>
                    <td class="borderAll col_36">7</td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!1!4')">
                        <asp:Label ID="tab_8_2_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!2!4')">
                        <asp:Label ID="tab_8_2_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!3!4')">
                        <asp:Label ID="tab_8_2_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!4!4')">
                        <asp:Label ID="tab_8_2_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!5!4')">
                        <asp:Label ID="tab_8_2_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!6!4')">
                        <asp:Label ID="tab_8_2_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!7!4')">
                        <asp:Label ID="tab_8_2_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!8.2!8!4')">
                        <asp:Label ID="tab_8_2_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="8.3" class="page-break">
            <asp:PlaceHolder runat="server" ID="TablePlaceHolder4"></asp:PlaceHolder>
        </div>

        <br />
        <table style="width: 100%;">
            <tr>
                <td><b>Dział 9.1</b> Liczba powołań tłumaczy  </td>
                <td class="center borderAll col_90"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!1!4')">
                    <asp:Label ID="tab_9_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                </a></td>
            </tr>
        </table>
        <br />
        <div id='9.2' class="page-break">
            <strong>Dział 9.2</strong> Terminowość sporządzania tłumaczeń pisemnych
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
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!1!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!2!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!3!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!4!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!5!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!6!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!7!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!8!4')">
                <asp:Label CssClass="normal" ID="tab_9_2_w01_c08" runat="server" Text="0"></asp:Label></a></td>
        </tr>
    </table>
        </div>

        <br />
        <div id="9.3" class="page-break">
            <strong>Dział 9.3</strong> Terminowość sporządzania tłumaczeń pisemnych
            <table>
                <tr>
                    <td class="center borderAll" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                    <td class="center borderAll" colspan="8">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                </tr>
                <tr>
                    <td class="center borderAll">razem
                        <br />
                        (kol.2-4)</td>
                    <td class="center borderAll">do 14 dni</td>
                    <td class="center borderAll">pow. 14 do 30 dni</td>
                    <td class="center borderAll">powyżej miesiąca</td>
                    <td class="center borderAll">razem (kol. 6-8)</td>
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
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!1!4')">
                        <asp:Label ID="tab_9_3_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!2!4')">
                        <asp:Label ID="tab_9_3_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!3!4')">
                        <asp:Label ID="tab_9_3_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!4!4')">
                        <asp:Label ID="tab_9_3_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!5!4')">
                        <asp:Label ID="tab_9_3_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!6!4')">
                        <asp:Label ID="tab_9_3_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!7!4')">
                        <asp:Label ID="tab_9_3_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!8!4')">
                        <asp:Label ID="tab_9_3_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!9!4')">
                        <asp:Label ID="tab_9_3_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!10!4')">
                        <asp:Label ID="tab_9_3_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!11!4')">
                        <asp:Label ID="tab_9_3_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                    <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!12!4')">
                        <asp:Label ID="tab_9_3_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                    </a></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />

        <asp:PlaceHolder runat="server" ID="TablePlaceHolder10"></asp:PlaceHolder>

        Obciążenia administracyjne respondentów
        <table style="width: 100%;">
            <tr>
                <td>Proszę podać czas (w minutach) przeznaczony na:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;przygotowanie danych dla potrzeb wypełnianego formularza</td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp; &nbsp;wypełnienie formularza</td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />

        <br />
    </div>
</asp:Content>