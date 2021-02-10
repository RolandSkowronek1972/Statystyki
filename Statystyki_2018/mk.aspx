<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mk.aspx.cs" Inherits="Statystyki_2018.mk" %>

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
    <script>
        function printIt() {
            window.print();
        }
    </script>

    <div id="menu" class="noprint" style="background-color: #f7f7f7; z-index: 9999">
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
                    <td style="width: auto; padding-left: 5px;" class="ax_box">
                        <button id="Button1" class="ax_box " onclick="printIt()">Drukuj</button>
                    </td>
                    <td style="width: auto; padding-left: 5px;">&nbsp;</td>
                    <td style="width: auto; padding-left: 5px;">
                        <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="excelZapisz">Zapisz do Excel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 59px; left: 3px;" >
    
    

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

            <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>

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