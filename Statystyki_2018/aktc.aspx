<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aktc.aspx.cs" Inherits="Statystyki_2018.aktc" %>

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

      @media print {

            @page {
                font-size: 7.5pt;
                size: 29cm 21.7cm;
                margin: 5mm 5mm 5mm 5mm;
            }

            .horizont {
                transform: translate(-65mm, 0) scale(0.5);
                -webkit-transform: translate(-65mm, 0) scale(0.5);
                -moz-transform: translate(-65mm, 0) scale(0.5);
                break-after: column;
            }
        }
    </style>

    <script src="Scripts/rls.js"></script>

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
                        <td style="width: auto; padding-left: 5px;">
                            <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>

                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">
        <div id="Div2" style="z-index: 10;" class="horizont">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>
        </div>

        <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; left: 0px; display: block">
            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
            <br />
        </div>
           <div id="debag">
            <br />
            <br />
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="LbDataRaportu" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

        
        </div>
    </div>
      <br />
  
</asp:Content>