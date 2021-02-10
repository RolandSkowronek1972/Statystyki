<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="Statystyki_2018.Template" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
  
#menu {
    position:relative;
}
#menu.scrolling {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}


            .auto-style1 {
        color: Black;
        text-decoration: none;
        list-style-type: none;
        position: relative;
        overflow: hidden;
        display: block;
        opacity: 1;
        background-color: rgba(255, 255, 255, 0.00);
        padding: 8px 10px 0px 10px;
        background-repeat: no-repeat;
        background-position: 50% 50%;
        background-size: auto 1.11111em;
        outline-offset: -0.22222em;
        -webkit-tap-highlight-color: transparent;
        -webkit-transition: opacity .2s cubic-bezier(0.645,0.045,0.355,1);
        -moz-transition: opacity .2s cubic-bezier(0.645,0.045,0.355,1);
        transition: opacity .2s cubic-bezier(0.645,0.045,0.355,1);
        transition: opacity .2s cubic-bezier(0.645,0.045,0.355,1);
        font: 16px/18px "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
        top: 0px;
        height: 24px;
        left: 1px;
    }


            </style>
      <script src="Scripts/jquery-1.8.3.js"></script>


    <script src="Scripts/rls.js"></script>
  
      <div class="noprint" >  
       <div id="menu" style="background-color: #f7f7f7;z-index:9999">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position:relative;  width: 1050px;    left: 0px;">               
   <table >
        <tr>
            <td style="width:auto;padding-left:5px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
            </td>
            <td style="width:auto;padding-left:5px;">

                <dx:aspxdateedit ID="Date1" runat="server" Theme="Moderno">
                </dx:aspxdateedit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:aspxdateedit ID="Date2" runat="server" Theme="Moderno">
                </dx:aspxdateedit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" OnClick="LinkButton55_Click" CssClass="auto-style1"> Drukuj </asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                
                &nbsp;</td>
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
            </div>
      </div>
     </div>  
    

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" >



     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
  

         <br />


     </div>
         <div id="tabela1"  class="page-break"> 

             aa
             <table style="width:100%;">
                 <tr>
                     <td class="borderAll center" colspan="9">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="borderAll center" rowspan="2">Ruch spraw</td>
                     <td class="borderAll center" colspan="8">Sprawy wg repertoriów lub wykazów</td>
                 </tr>
                 <tr>
                     <td class="borderAll center col_75">GC</td>
                     <td class="borderAll center col_75">GC upr.</td>
                     <td class="borderAll center col_75">GC Razem</td>
                     <td class="borderAll center col_75">GNS</td>
                     <td class="borderAll center col_75">GCO</td>
                     <td class="borderAll center col_75">GCPS</td>
                     <td class="borderAll center col_75">WSC</td>
                     <td class="borderAll center col_75">Łącznie</td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Pozostało z ubiegłego miesiąca</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label ID="tab_01_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label ID="tab_01_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label ID="tab_01_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label ID="tab_01_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!5!3')"><asp:Label ID="tab_01_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!6!3')"><asp:Label ID="tab_01_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!7!3')"><asp:Label ID="tab_01_w01_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!8!3')"><asp:Label ID="tab_01_w01_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Wpływ od początku roku do końca bieżącego miesiąca</td>
                             <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!1!3')"><asp:Label ID="tab_01_w02_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!2!3')"><asp:Label ID="tab_01_w02_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!3!3')"><asp:Label ID="tab_01_w02_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!4!3')"><asp:Label ID="tab_01_w02_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!5!3')"><asp:Label ID="tab_01_w02_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!6!3')"><asp:Label ID="tab_01_w02_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!7!3')"><asp:Label ID="tab_01_w02_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!1!8!3')"><asp:Label ID="tab_01_w02_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
         </tr>
                 <tr>
                     <td class="borderAll wciecie">Wpływ za miesiąc bieżący</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!1!3')"><asp:Label ID="tab_01_w03_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!2!3')"><asp:Label ID="tab_01_w03_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!3!3')"><asp:Label ID="tab_01_w03_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!4!3')"><asp:Label ID="tab_01_w03_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!5!3')"><asp:Label ID="tab_01_w03_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!6!3')"><asp:Label ID="tab_01_w03_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!7!3')"><asp:Label ID="tab_01_w03_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!1!8!3')"><asp:Label ID="tab_01_w03_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Załatwienia od początku roku do końca bieżącego miesiąca</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!1!3')"><asp:Label ID="tab_01_w04_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!2!3')"><asp:Label ID="tab_01_w04_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!3!3')"><asp:Label ID="tab_01_w04_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!4!3')"><asp:Label ID="tab_01_w04_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!5!3')"><asp:Label ID="tab_01_w04_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!6!3')"><asp:Label ID="tab_01_w04_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!7!3')"><asp:Label ID="tab_01_w04_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!1!8!3')"><asp:Label ID="tab_01_w04_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">załatwienia</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!1!3')"><asp:Label ID="tab_01_w05_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!2!3')"><asp:Label ID="tab_01_w05_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!3!3')"><asp:Label ID="tab_01_w05_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!4!3')"><asp:Label ID="tab_01_w05_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!5!3')"><asp:Label ID="tab_01_w05_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!6!3')"><asp:Label ID="tab_01_w05_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!7!3')"><asp:Label ID="tab_01_w05_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!1!8!3')"><asp:Label ID="tab_01_w05_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">Pozostało na następny miesiąc ( w tym poniżej)</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!1!3')"><asp:Label ID="tab_01_w06_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!2!3')"><asp:Label ID="tab_01_w06_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!3!3')"><asp:Label ID="tab_01_w06_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!4!3')"><asp:Label ID="tab_01_w06_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!5!3')"><asp:Label ID="tab_01_w06_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!6!3')"><asp:Label ID="tab_01_w06_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!7!3')"><asp:Label ID="tab_01_w06_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!1!8!3')"><asp:Label ID="tab_01_w06_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">3-6 miesięcy</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!1!3')"><asp:Label ID="tab_01_w07_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!2!3')"><asp:Label ID="tab_01_w07_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!3!3')"><asp:Label ID="tab_01_w07_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!4!3')"><asp:Label ID="tab_01_w07_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!5!3')"><asp:Label ID="tab_01_w07_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!6!3')"><asp:Label ID="tab_01_w07_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!7!3')"><asp:Label ID="tab_01_w07_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=7!1!8!3')"><asp:Label ID="tab_01_w07_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">6-12 miesięcy</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!1!3')"><asp:Label ID="tab_01_w08_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!2!3')"><asp:Label ID="tab_01_w08_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!3!3')"><asp:Label ID="tab_01_w08_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!4!3')"><asp:Label ID="tab_01_w08_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!5!3')"><asp:Label ID="tab_01_w08_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!6!3')"><asp:Label ID="tab_01_w08_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!7!3')"><asp:Label ID="tab_01_w08_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=8!1!8!3')"><asp:Label ID="tab_01_w08_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">12-24 miesięce</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!1!3')"><asp:Label ID="tab_01_w09_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!2!3')"><asp:Label ID="tab_01_w09_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!3!3')"><asp:Label ID="tab_01_w09_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!4!3')"><asp:Label ID="tab_01_w09_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!5!3')"><asp:Label ID="tab_01_w09_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!6!3')"><asp:Label ID="tab_01_w09_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!7!3')"><asp:Label ID="tab_01_w09_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=9!1!8!3')"><asp:Label ID="tab_01_w09_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">powyżej 24 miesięcy</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!1!3')"><asp:Label ID="tab_01_w10_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!2!3')"><asp:Label ID="tab_01_w10_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!3!3')"><asp:Label ID="tab_01_w10_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!4!3')"><asp:Label ID="tab_01_w10_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!5!3')"><asp:Label ID="tab_01_w10_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!6!3')"><asp:Label ID="tab_01_w10_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!7!3')"><asp:Label ID="tab_01_w10_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=10!1!8!3')"><asp:Label ID="tab_01_w10_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
                 <tr>
                     <td class="borderAll wciecie">wskaźnik</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!1!3')"><asp:Label ID="tab_01_w11_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!2!3')"><asp:Label ID="tab_01_w11_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!3!3')"><asp:Label ID="tab_01_w11_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!4!3')"><asp:Label ID="tab_01_w11_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!5!3')"><asp:Label ID="tab_01_w11_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!6!3')"><asp:Label ID="tab_01_w11_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!7!3')"><asp:Label ID="tab_01_w11_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=11!1!8!3')"><asp:Label ID="tab_01_w11_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                 </tr>
             </table>
             </div>
   <div id="wplyw"  class="page-break"> 
    <br />
    


    <asp:Label ID="tabela2Label" runat="server"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
       <br />
       <asp:GridView ID="Tabela1" runat="server" OnRowCreated="naglowekTabeli_Tabela1"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_Tabela1"  DataSourceID = "daneDoTabeli1"  Width = "100%" ShowHeader = "False"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label5" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label6"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
<asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_Tabela1101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_Tabela1102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_Tabela1103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_Tabela1104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_Tabela1105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_Tabela1106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_Tabela1107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_Tabela1108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_Tabela1109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_Tabela1110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_Tabela1111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_Tabela1112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_Tabela1113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_14" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_Tabela1114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                </ItemTemplate>
                   <ItemStyle  CssClass = "col_30"/>
                </asp:TemplateField>

        </Columns>
    </asp:GridView>
                  <asp:SqlDataSource ID = "daneDoTabeli1" runat = "server"        ConnectionString = "<%$ConnectionStrings:wap %>"
            SelectCommand = "SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, d_30, d_31, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 1) AND (id_dzialu = @id_dzialu) ORDER BY id">
                   <SelectParameters>
                       <asp:SessionParameter Name = "id_dzialu" SessionField = "id_dzialu"/> 
                      </SelectParameters>
                  </asp:SqlDataSource>

       <br />
 <br />
       </div>
    
    <div id="wyznaczenia0"  class="page-break"> 
        <asp:Label ID="lbTabela3Title" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel4" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="Gridview3" runat="server" AutoGenerateColumns="False" DataSourceID = "tabela_3"  Width = "100%" ShowHeader = "False" ShowFooter = "True" OnRowCreated="naglowekTabela3" OnRowDataBound="Gridview3_RowDataBound"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label7" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label8"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
<asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_Gridview3101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_Gridview3102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_Gridview3103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_Gridview3104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
    <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_Gridview3104" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_Gridview3106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_90"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <br />
    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28,d_29,d_30, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        </div>
    
    <br />

    <div id="debag" >
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

    
</asp:Content>


