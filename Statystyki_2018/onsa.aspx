<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onsa.aspx.cs" Inherits="Statystyki_2018.onsa" %>

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

    <div id="menu" class="manu_back noprint" style="height: 40px;">

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
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton55" runat="server" class="ax_box" CssClass="ax_box"> Drukuj </asp:LinkButton>
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;">

        <div>
            <br />
            <asp:Label ID="Label11" runat="server" Text=" Struktura pozostałości Sąd Rejonowy w Nowym Sączu"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel13" runat="server" Text="tabela  1 \/\/\/"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB13"></asp:PlaceHolder>
            <br />
            <br />
        </div>
         <div id="TABELA2" class="page-break">
        <table style="width: 100%;">
            <tr>
                <td class="borderAll col_75" rowspan="2">Kategoria spraw</td>
                <td class="borderAll col_75" rowspan="2">Rok</td>
                <td class="borderAll center" colspan="12">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
            </tr>
            <tr>
                <td class="borderAll col_75">Razem</td>
                <td class="borderAll col_75">do 3 m-cy</td>
                <td class="borderAll col_75">suma pow. 3 m-cy</td>
                <td class="borderAll col_75">pow. 3 do 6 m-cy</td>
                <td class="borderAll col_75">pow. 6 do 12 m-cy</td>
                <td class="borderAll col_75">suma pow. 12 m-cy</td>
                <td class="borderAll col_75">suma pow. 12 m-cy</td>
                <td class="borderAll col_75">pow. 2 do 3 lat</td>
                <td class="borderAll col_75">suma pow. 3 lat</td>
                <td class="borderAll col_75">pow. 3 do 5 lat</td>
                <td class="borderAll col_75">pow. 5 do 8 lat</td>
                <td class="borderAll col_75">ponad 8 lat</td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w01_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w02_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w03_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w04_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w05_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w06_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w07_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w08_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w09_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!1!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!2!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!3!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!4!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!5!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!6!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!7!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!8!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!9!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!10!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!11!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!12!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!13!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                <td class="borderAll col_75">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!2!14!3')">
                        <asp:Label CssClass="normal" ID="tab_2_w10_c14" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
    </div>
        <div>
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label16" runat="server"></asp:Label>
        </div>
         
    </div>
  
</asp:Content>