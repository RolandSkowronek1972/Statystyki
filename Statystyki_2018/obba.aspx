<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="obba.aspx.cs" Inherits="Statystyki_2018.obba" %>

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
            height: 23px;
        }
        @media print {
           

            .horizont {
                transform: translate(-15mm, 0) scale(0.9);
                -webkit-transform: translate(-15mm, 0) scale(0.9);
                -moz-transform: translate(-15mm, 0) scale(0.9);
            }
        }
    </style>

    <script src="Scripts/jquery.print.js"></script>

    <script src="Scripts/rls.js"></script>
    <script>
        function printIt()
            {
                window.print();
            }
    </script>

                <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
                <table>
                    <tr>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;" class="az">
                            <button id="Button1" class="ax_box " onclick="printIt()">Drukuj</button>
                        </td>
                        <td style="width: auto; padding-left: 5px;">&nbsp;</td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>

            <br />
            <div class="horizont">

                  <table style="width: 100%;">
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" "></td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll">Wpływ</td>
                    <td class="col_60 borderAll">Załatwiono</td>
                    <td class="col_60 borderAll">Pozostało</td>
                    <td></td>
                    <td>&nbsp;</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">Pow.12 m-cy</td>
                </tr>
                <tr>
                    <td class="borderAll">wskaźnik opanowania wpływu spraw rozpatrywanych przez sądy I instancji</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Cywilny</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">C</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">średni czas trwania postępowania w sprawach cywilnych, pracy, rodzinnych, ubezpieczeń spłecznych, karnych i gospodarczych (z wyłączeniem spraw wieczystoksięgowych i rejestrowych)(w miesiącach)</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Karny</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Ns</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 12 m-cy</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Pracy</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Nc</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">liczba etatów asystenckich na etat sędziego</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Rodzinny</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">K</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">liczba spraw (w wybranych kategoriach) załatwionych przez referendarzy przypadająca na jeden etat referendarski</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">&nbsp;</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Kp</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">liczba spraw zakończonych w okresie sprawozdawczym przypadających na jednego kuratora zawodowego</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Kw</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">W</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">liczba osób, wobec których sądy orzekły wypłatę odszkodowań za naruszenie prawa strony do rozpoznania sprawy w postępowaniu sądowym bez nieuzasadnionej zwłoki</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Bez Kw</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">P,Np.</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">wskaźnik opanowania wpływu głównych kategorii spraw rozpatrywanych przez sądy I instancji*</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Suma</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">RC</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 3 lata</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll gray">RNs</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">odsetek spraw skierowanych do mediacji w stosunku do wszystkich spraw wpływających do sądu, w których mediacja może być zastosowana</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll gray">NSm</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">Ogółem</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll">&nbsp;</td>
                    <td class="col_60 borderAll">Wpływ</td>
                    <td class="col_60 borderAll">Załatwiono</td>
                    <td class="col_60 borderAll">Pozyostało</td>
                    <td class="col_60">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll">Ogółem</td>
                    <td class="col_60 borderAll">pow 3 lat</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">C</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">C</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">K</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">K</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">W</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">W</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">P</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">P</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">RC</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">RC</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">RNs</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">RNs</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">Nsm</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Nsm</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">Suma</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!4!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!5!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll gray">Suma</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!6!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!1!7!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="center borderAll" colspan="4">Mediacje</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll">&nbsp;</td>
                    <td class="col_60 borderAll">Ogółem</td>
                    <td class="center borderAll" colspan="2">skier. Do mediacji</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">C</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll gray">K</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">W</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">P</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">RC</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w24_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=24!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w24_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">RNs</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=25!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w25_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=25!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w25_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">Nsm</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=26!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w26_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=26!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w26_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class="col_60 borderAll gray">Suma</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=27!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w27_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=27!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w27_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="center borderAll" colspan="3">Asystenci Sędziego</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll">Sędziowie</td>
                    <td class="center borderAll" colspan="2">Asystenci</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
                <tr>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="col_60 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=28!1!2!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w28_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="center borderAll" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=28!1!3!3')">
                            <asp:Label CssClass="normal" ID="tab_1_w28_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                    <td class=" ">&nbsp;</td>
                </tr>
            </table>
            </div>
          
        </div>

        <br />
        <div id="tab2" class="page-break">
            <asp:Label ID="Label17" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel2" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <div id="tab3" class="page-break">
                <br />
            </div>

            <div id="debag">
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
    </div>
</asp:Content>