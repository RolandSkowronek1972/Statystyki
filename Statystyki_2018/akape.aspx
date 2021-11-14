<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="akape.aspx.cs" Inherits="Statystyki_2018.akape"  MaintainScrollPositionOnPostback="true" %>


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


    </style>
  
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

                <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" OnClick="LinkButton55_Click" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                
                 <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />

            </td>
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
            </div>
      </div>
     </div> 
   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" >

          <div id="tabela1"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label6" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
             <asp:label runat="server" ID="Label9" Visible="False"></asp:label></div> 
 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
             </asp:SqlDataSource>
     </div>



     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">  
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div> 
  

         <br />
              <table style="width: 100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td align="center" colspan="3" valign="middle" class="auto-style3">
                          <asp:Label ID="Label713" runat="server" Text="Ewidencja spraw" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label></td>
                        <td class="auto-style3"></td>
                        <td align="center" colspan="4" class="auto-style3">&nbsp;</td>
                                           
                  </tr>
                  
                   <tr>
                      <td colspan="3" rowspan="2" align="center" style="border: medium solid #000000;" valign="middle">
                          <asp:Label ID="Label52" runat="server" Text="Sprawy wg ksiąg"></asp:Label></td>
                        <td rowspan="2" style="border-style: solid; border-width: medium thin medium thin; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label55" runat="server" Text="nr"></asp:Label></td>
                        <td align="center" colspan="4" style="border-style: solid; border-width: medium thin thin thin; border-color: #000000;"><asp:Label ID="Label23" runat="server" Text="C"></asp:Label></td>
                                           
                  </tr>
                   <tr>
                        <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000; " align="center" class="col_200"><asp:Label ID="Label98" runat="server" Text="Kow"></asp:Label></td>
                        <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000; width: 200px;" align="center" class="col_200"><asp:Label ID="Label99" runat="server" Text="Pen"></asp:Label></td>
                        <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000; width: 150px;" align="center" class="col_200"><asp:Label ID="Label100" runat="server" Text="Inne"></asp:Label></td>
                        <td style="border-style: solid; border-width: thin thin medium thin; border-color: #000000;" align="center" class="col_200"><asp:Label ID="Label101" runat="server" Text="OGÓŁEM"></asp:Label></td>
                                           
                  </tr>
                   <tr>
                      <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                          <asp:Label ID="Label118" runat="server" Text="Pozostało z ubiegłego miesiąca"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="LB_11" runat="server" Text="1"></asp:Label></td>
                           <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label CssClass="normal" ID="LB_12" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label CssClass="normal" ID="LB_13" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label CssClass="normal" ID="LB_14" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label CssClass="normal" ID="LB_15" runat="server" Text="0"></asp:Label></a></td>
                        
                     
                                           
                  </tr>
                   <tr>
                      <td rowspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000; width: 70px;" align="center">
                          <asp:Label ID="Label142" runat="server" Text="Wpłynęło"></asp:Label></td>
                        <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center"><strong><asp:Label ID="Label143" runat="server" Text="razem"></asp:Label></strong></td>
                      <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center" class="col_50"><asp:Label CssClass="normal" ID="LB_21" runat="server" Text="2"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!1!1!3')"><asp:Label CssClass="normal" ID="LB_22" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=2!1!2!3')"><asp:Label CssClass="normal" ID="LB_23" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!1!3!3')"><asp:Label CssClass="normal" ID="LB_24" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!1!4!3')"><asp:Label CssClass="normal" ID="LB_25" runat="server" Text="0"></asp:Label></a></td>                             
                  </tr>
                   <tr>
                        <td rowspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center"><asp:Label ID="Label167" runat="server" Text="w tym &lt;br/&gt;ponownie&lt;br/&gt; wpisane"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center" class="auto-style6"><asp:Label ID="Label168" runat="server" Text="ogółem"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label169" runat="server" Text="3"></asp:Label></td>
                       <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!1!1!3')"><asp:Label CssClass="normal" ID="LB_32" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=3!1!2!3')"><asp:Label CssClass="normal" ID="LB_33" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!1!3!3')"><asp:Label CssClass="normal" ID="LB_34" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!1!4!3')"><asp:Label CssClass="normal" ID="LB_35" runat="server" Text="0"></asp:Label></a></td>
                                               
                  </tr>
                   <tr>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000;" align="center" class="auto-style9"><asp:Label ID="Label192" runat="server" Text="przekazane z&lt;br/&gt;innej jednostki"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label193" runat="server" Text="4"></asp:Label></td>
                       <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!1!1!3')"><asp:Label CssClass="normal" ID="LB_42" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=4!1!2!3')"><asp:Label CssClass="normal" ID="LB_43" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!1!3!3')"><asp:Label CssClass="normal" ID="LB_44" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!1!4!3')"><asp:Label CssClass="normal" ID="LB_45" runat="server" Text="0"></asp:Label></a></td>
                                            
                  </tr>
                   <tr>
                      <td rowspan="2" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000; width: 70px;" align="center">
                          <asp:Label ID="Label226" runat="server" Text="załatwiono"></asp:Label></td>
                      <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center"><asp:Label ID="Label227" runat="server" Text="razem" Font-Bold="True"></asp:Label></td>
                       <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label39" runat="server" Text="5"></asp:Label></td> 
                       <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!1!1!3')"><asp:Label CssClass="normal" ID="LB_52" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=5!1!2!3')"><asp:Label CssClass="normal" ID="LB_53" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!1!3!3')"><asp:Label CssClass="normal" ID="LB_54" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!1!4!3')"><asp:Label CssClass="normal" ID="LB_55" runat="server" Text="0"></asp:Label></a></td>
                                                
                  </tr>
                   <tr>
                      <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 140px;" align="center"><asp:Label ID="Label251" runat="server" Text="w tym przekazano &lt;br/&gt;do innej jednostki"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label253" runat="server" Text="6"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!1!1!3')"><asp:Label CssClass="normal" ID="LB_62" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!1!2!3')"><asp:Label CssClass="normal" ID="LB_63" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!1!3!3')"><asp:Label CssClass="normal" ID="LB_64" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!1!4!3')"><asp:Label CssClass="normal" ID="LB_65" runat="server" Text="0"></asp:Label></a></td>
                                  
                  </tr>
                   <tr>
                      <td rowspan="4" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000; width: 70px;" align="center">
                          <asp:Label ID="Label274" runat="server" Text="pozostało na &lt;br/&gt; następny m-c"></asp:Label></td>
                      <td colspan="2" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center"><asp:Label ID="Label275" runat="server" Text="razem" Font-Bold="True"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label277" runat="server" Text="7"></asp:Label></td>
                      <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!1!1!3')"><asp:Label CssClass="normal" ID="LB_72" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=7!1!2!3')"><asp:Label CssClass="normal" ID="LB_73" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!1!3!3')"><asp:Label CssClass="normal" ID="LB_74" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!1!4!3')"><asp:Label CssClass="normal" ID="LB_75" runat="server" Text="0"></asp:Label></a></td>
                                 
                  </tr>
                   <tr>
                      <td rowspan="3" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center"><asp:Label ID="Label299" runat="server" Text="w tym"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center" class="auto-style6"><asp:Label ID="Label300" runat="server" Text="pow. 3-6 m-cy"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label310" runat="server" Text="8"></asp:Label></td>
                      <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!1!1!3')"><asp:Label CssClass="normal" ID="LB_82" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=8!1!2!3')"><asp:Label CssClass="normal" ID="LB_83" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!1!3!3')"><asp:Label CssClass="normal" ID="LB_84" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!1!4!3')"><asp:Label CssClass="normal" ID="LB_85" runat="server" Text="0"></asp:Label></a></td>
                                            
                  </tr>
                   <tr>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center" class="auto-style6"><asp:Label ID="Label333" runat="server" Text="pow. 6-12 m-cy"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label334" runat="server" Text="9"></asp:Label></td>
                         <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!1!1!3')"><asp:Label CssClass="normal" ID="LB_92" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!1!2!3')"><asp:Label CssClass="normal" ID="LB_93" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!1!3!3')"><asp:Label CssClass="normal" ID="LB_94" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!1!4!3')"><asp:Label CssClass="normal" ID="LB_95" runat="server" Text="0"></asp:Label></a></td>
                                     
                  </tr>
                   <tr>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; width: 70px;" align="center" class="auto-style6"><asp:Label ID="Label357" runat="server" Text="pow. 12 m-cy"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label358" runat="server" Text="10"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!1!1!3')"><asp:Label CssClass="normal" ID="LB_102" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=10!1!2!3')"><asp:Label CssClass="normal" ID="LB_103" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!1!3!3')"><asp:Label CssClass="normal" ID="LB_104" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!1!4!3')"><asp:Label CssClass="normal" ID="LB_105" runat="server" Text="0"></asp:Label></a></td>
                             </tr>
                   <tr>
                      <td class="auto-style2" colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                          <asp:Label ID="Label379" runat="server" Text="liczba spraw zawieszonych"></asp:Label></td>
                        <td class="col_50" style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center"><asp:Label ID="Label382" runat="server" Text="11"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!1!1!3')"><asp:Label CssClass="normal" ID="LB_11_2" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!1!2!3')"><asp:Label CssClass="normal" ID="LB_11_3" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!1!3!3')"><asp:Label CssClass="normal" ID="LB_11_4" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!1!4!3')"><asp:Label CssClass="normal" ID="LB_11_5" runat="server" Text="0"></asp:Label></a></td>
                                                     
                  </tr>
                   <tr>
                      <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                          <asp:Label ID="Label412" runat="server" Text="wpływ od początku roku (narastająco)"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label415" runat="server" Text="12"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!1!1!3')"><asp:Label CssClass="normal" ID="LB_122" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!1!2!3')"><asp:Label CssClass="normal" ID="LB_123" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!1!3!3')"><asp:Label CssClass="normal" ID="LB_124" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!1!4!3')"><asp:Label CssClass="normal" ID="LB_125" runat="server" Text="0"></asp:Label></a></td>
                                         
                  </tr>
                   <tr>
                      <td colspan="3" style="border-style: solid; border-width: 0px 0px 1px medium; border-color: #000000;" align="center">
                          <asp:Label ID="Label436" runat="server" Text="Przeciętny miesięczny wpływ &lt;br/&gt; (w. 12/ ilość miesięcy)"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label439" runat="server" Text="13"></asp:Label></td>
                       <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!1!1!3')"><asp:Label CssClass="normal" ID="LB_132" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!1!2!3')"><asp:Label CssClass="normal" ID="LB_133" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!1!3!3')"><asp:Label CssClass="normal" ID="LB_134" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium 1px 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!1!4!3')"><asp:Label CssClass="normal" ID="LB_135" runat="server" Text="0"></asp:Label></a></td>
                                           
                  </tr>
                   <tr>
                      <td colspan="3" style="border-style: solid; border-width: 0px 0px medium medium; border-color: #000000;" align="center">
                          <asp:Label ID="Label460" runat="server" Text="Wskaźnik zaległości (w.7/13)"></asp:Label></td>
                        <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; " align="center" class="col_50"><asp:Label ID="Label463" runat="server" Text="14"></asp:Label></td>
                     <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!1!1!3')"><asp:Label CssClass="normal" ID="LB_142" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; " align="center" class="col_200" ><a href="javascript:openPopup('popup.aspx?sesja=14!1!2!3')"><asp:Label CssClass="normal" ID="LB_143" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px 0px medium 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!1!3!3')"><asp:Label CssClass="normal" ID="LB_144" runat="server" Text="0"></asp:Label></a></td>
                        <td style="border-style: solid; border-width: 0px medium medium 1px; border-color: #000000; " align="center" class="col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!1!4!3')"><asp:Label CssClass="normal" ID="LB_145" runat="server" Text="0"></asp:Label></a></td>
                              
                  </tr>
                  
                                </table>


         <br />


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        onrowcreated="GridView2_RowCreated" DataSourceID="dane_do_tabeli_1" 
        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="col_155" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!1!1"%>')"><asp:Label ID="Label11" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
                        
               </ItemTemplate>
  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!2!1"%>')"><asp:Label ID="Label12" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
            <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!3!1"%>')"><asp:Label ID="Label13" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')"><asp:Label ID="Label14" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
                   </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')"><asp:Label ID="Label15"  runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')"><asp:Label ID="Label16"  runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
              </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')"><asp:Label ID="Label17"  runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                      
                </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!8!1"%>')"><asp:Label ID="Label18"  runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
                         </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!9!1"%>')"><asp:Label ID="Label19"  runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                         </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
  
    

    <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
     </div>
   <div id="zalatwienia"  class="page-break"> 
    <br />
    


    <asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView1_RowCreated" 
        Width="100%" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <FooterTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Eval("d_06") %>'></asp:TextBox>
                </FooterTemplate>
               
                <ItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Eval("d_06") %>'></asp:TextBox>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_190" />
            </asp:TemplateField>

        
             
        </Columns>
           <FooterStyle CssClass="normal" HorizontalAlign="Center" BackColor="#CCCCCC" />
    </asp:GridView>
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <asp:Label ID="Label17" runat="server"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" onrowcreated="GridView3_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t3_nazwisko" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_287" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_287" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_287" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_287" />
            </asp:TemplateField>
       
          




        </Columns>
        <FooterStyle CssClass="normal" HorizontalAlign="Center" BackColor="#CCCCCC" />
        <RowStyle Height="25px" />
    </asp:GridView>
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

