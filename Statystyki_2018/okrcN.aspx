<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="okrcN.aspx.cs" Inherits="Statystyki_2018.okrcN" %>

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

                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />
</td>
            <td>

                &nbsp;</td>
            <td>

                &nbsp;</td>
            <td>

                &nbsp;</td>
            <td>
                 &nbsp;</td>
        </tr>
    </table>
    </div>
           </div>
      </div>

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative; left: 0px; display:block">

   
     

  &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder01"></asp:PlaceHolder>
    <br />



    
    </div>
</asp:Content>