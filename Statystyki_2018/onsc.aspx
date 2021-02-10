<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onsc.aspx.cs" Inherits="Statystyki_2018.onsc" %>
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
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">  
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div> 
  

         <asp:Label ID="Label5" runat="server"></asp:Label>
  
         <br />
         <table style="width:100%;">
             <tr>
                 <td class="borderAll center" rowspan="2">Ruch spraw</td>
                 <td class="borderAll center" colspan="6">Sprawy wg repetoriów lub wykazów</td>
             </tr>
             <tr>
                 <td class="borderAll center col_166">C</td>
                 <td class="borderAll center col_166">Ns</td>
                 <td class="borderAll center col_166">Nc</td>
                 <td class="borderAll center col_166">Co</td>
                 <td class="borderAll center col_166">Cps</td>
                 <td class="borderAll center col_166">Łącznie</td>
             </tr>
             <tr>
                 <td class="borderAll wciecie">Pozostało z ubiegłego miesiąca</td>
      <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label ID="tab_01_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label ID="tab_01_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label ID="tab_01_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label ID="tab_01_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!5!3')"><asp:Label ID="tab_01_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=1!1!6!3')"><asp:Label ID="tab_01_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                         </tr>
             <tr>
                 <td class="borderAll wciecie">do końca bieżącego miesiąca</td>
                    <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!1!3')"><asp:Label ID="tab_01_w02_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!2!3')"><asp:Label ID="tab_01_w02_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!3!3')"><asp:Label ID="tab_01_w02_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!4!3')"><asp:Label ID="tab_01_w02_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!5!3')"><asp:Label ID="tab_01_w02_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=2!1!6!3')"><asp:Label ID="tab_01_w02_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                             </tr>
             <tr>
                 <td class="borderAll wciecie">Wpływ za miesiąc bieżący</td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!1!3')"><asp:Label ID="tab_01_w03_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!2!3')"><asp:Label ID="tab_01_w03_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!3!3')"><asp:Label ID="tab_01_w03_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!4!3')"><asp:Label ID="tab_01_w03_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!5!3')"><asp:Label ID="tab_01_w03_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=3!1!6!3')"><asp:Label ID="tab_01_w03_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
               </tr>
             <tr>
                 <td class="borderAll wciecie">Załatwienia</td>
                    <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!1!3')"><asp:Label ID="tab_01_w04_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!2!3')"><asp:Label ID="tab_01_w04_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!3!3')"><asp:Label ID="tab_01_w04_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!4!3')"><asp:Label ID="tab_01_w04_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!5!3')"><asp:Label ID="tab_01_w04_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=4!1!6!3')"><asp:Label ID="tab_01_w04_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  
             </tr>
             <tr>
                 <td class="borderAll wciecie">do końca bieżącego miesiąca</td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!1!3')"><asp:Label ID="tab_01_w05_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!2!3')"><asp:Label ID="tab_01_w05_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!3!3')"><asp:Label ID="tab_01_w05_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!4!3')"><asp:Label ID="tab_01_w05_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!5!3')"><asp:Label ID="tab_01_w05_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=5!1!6!3')"><asp:Label ID="tab_01_w05_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
             <tr>
                 <td class="borderAll wciecie">Pozostało na następny miesiąc ( w tym poniżej)</td>
                       <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!1!3')"><asp:Label ID="tab_01_w06_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!2!3')"><asp:Label ID="tab_01_w06_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!3!3')"><asp:Label ID="tab_01_w06_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!4!3')"><asp:Label ID="tab_01_w06_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!5!3')"><asp:Label ID="tab_01_w06_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=6!1!6!3')"><asp:Label ID="tab_01_w06_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                          </tr>
             <tr>
                 <td class="borderAll wciecie">3 – 6 miesięcy</td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!1!3')"><asp:Label ID="tab_01_w07_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!2!3')"><asp:Label ID="tab_01_w07_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!3!3')"><asp:Label ID="tab_01_w07_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!4!3')"><asp:Label ID="tab_01_w07_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!5!3')"><asp:Label ID="tab_01_w07_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=7!1!6!3')"><asp:Label ID="tab_01_w07_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
             <tr>
                 <td class="borderAll wciecie">6 – 12 miesięcy</td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!1!3')"><asp:Label ID="tab_01_w08_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!2!3')"><asp:Label ID="tab_01_w08_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!3!3')"><asp:Label ID="tab_01_w08_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!4!3')"><asp:Label ID="tab_01_w08_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!5!3')"><asp:Label ID="tab_01_w08_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=8!1!6!3')"><asp:Label ID="tab_01_w08_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
             <tr>
                 <td class="borderAll wciecie">12 - 24 miesięcy </td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!1!3')"><asp:Label ID="tab_01_w09_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!2!3')"><asp:Label ID="tab_01_w09_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!3!3')"><asp:Label ID="tab_01_w09_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!4!3')"><asp:Label ID="tab_01_w09_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!5!3')"><asp:Label ID="tab_01_w09_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=9!1!6!3')"><asp:Label ID="tab_01_w09_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
             <tr>
                 <td class="borderAll wciecie">powyżej 24 miesięcy </td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!1!3')"><asp:Label ID="tab_01_w10_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!2!3')"><asp:Label ID="tab_01_w10_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!3!3')"><asp:Label ID="tab_01_w10_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!4!3')"><asp:Label ID="tab_01_w10_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!5!3')"><asp:Label ID="tab_01_w10_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=10!1!6!3')"><asp:Label ID="tab_01_w10_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
             <tr>
                 <td class="borderAll wciecie">wskaźnik </td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!1!3')"><asp:Label ID="tab_01_w11_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!2!3')"><asp:Label ID="tab_01_w11_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!3!3')"><asp:Label ID="tab_01_w11_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!4!3')"><asp:Label ID="tab_01_w11_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!5!3')"><asp:Label ID="tab_01_w11_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                  <td class="borderAll center col_166">   <a href="javascript:openPopup('popup.aspx?sesja=11!1!6!3')"><asp:Label ID="tab_01_w11_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                               </tr>
         </table>

    <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_,id_tabeli , opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15 FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
     </div>
   <div id="zalatwienia"  class="page-break"> 
    <br />
    


    <asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" OnRowCreated="GridView1_RowCreated"  AutoGenerateColumns="False"  DataSourceID = "statystyki"  Width = "100%" ShowHeader = "False"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label1" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label2"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_GridView1101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_GridView1102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_GridView1103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_GridView1104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_GridView1105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_GridView1106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_GridView1107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_GridView1108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_GridView1109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_GridView1110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_82"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="statystyki" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <asp:Label ID="Label17" runat="server"></asp:Label>
        <asp:GridView ID="GridView3" runat="server" OnRowCreated="GridView3_RowCreated"  AutoGenerateColumns="False"  DataSourceID = "tabela_3"  Width = "100%" ShowHeader = "False"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label12" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label18"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_GridView3101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_GridView3102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_GridView3103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_GridView3104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_GridView3105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_GridView3106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_GridView3107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_117"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
    
    <br />
    <div id="Div1"  class="page-break"> 
    &nbsp;<asp:Label ID="Label15" runat="server"></asp:Label>
        &nbsp; &nbsp;<asp:GridView ID="GridView5" runat="server" OnRowCreated="GridView4_RowCreated"  AutoGenerateColumns="False"  DataSourceID = "tabela_4"  Width = "100%" ShowHeader = "False"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label13" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label14"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_GridView5101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_GridView5102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_GridView5103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_GridView5104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_GridView5105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_GridView5106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_GridView5107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_GridView5108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_103"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="tabela_4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego,id_tabeli FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />

         </div>
        <div id="Div6"  class="page-break"> 

        <asp:Label ID="Label34" runat="server" Visible="False"></asp:Label>
        <asp:GridView ID="GridView6" runat="server" OnRowCreated="GridView6_RowCreated"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_GridView6"  DataSourceID = "tabela_5"  Width = "100%" ShowHeader = "False"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label9" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label16"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_GridView6101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_GridView6102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_GridView6103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_GridView6104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_GridView6105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_GridView6106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_GridView6107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_GridView6108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_GridView6109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_GridView6110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_GridView6111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_GridView6112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
 
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="tabela_5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_tabeli, id_sedziego FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 5) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
  

        <br />
         </div>
        <div id="Div7"  class="page-break"> 
        <asp:Label ID="Label35" runat="server"></asp:Label>
  

            <asp:GridView ID="GridView7" runat="server" OnRowCreated="GridView7_RowCreated"  AutoGenerateColumns="False"  DataSourceID = "dane_do_tabeli_6"  Width = "100%" ShowHeader = "False"  >
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
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_GridView7101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_GridView7102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_GridView7103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_GridView7104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_GridView7105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_GridView7106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_GridView7107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_GridView7108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_GridView7109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_GridView7110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_68"/>
                </asp:TemplateField>
 
                   </Columns>
    </asp:GridView>
                  <asp:SqlDataSource ID = "dane_do_tabeli_6" runat = "server" ConnectionString = "<%$ ConnectionStrings:wap %>" 
            SelectCommand = "SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, d_30, d_31, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 6) AND (id_dzialu = @id_dzialu) ORDER BY id" >
                   <SelectParameters>
                       <asp:SessionParameter Name = "id_dzialu" SessionField = "id_dzialu" /> 
                      </SelectParameters>
                  </asp:SqlDataSource>

  


        <br />
  
    

    </div>

        <div id="Div9"  class="page-break"> 
  

            Struktura pozostałości (wydział ogółem – liczba spraw)
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="borderAll col_88 wciecie" rowspan="2">kategoria spraw</td>
                    <td class="borderAll col_88" rowspan="2">Miesiąc</td>
                    <td class="borderAll center" colspan="11">liczba spraw ( w tym zawieszone) </td>
                </tr>
                <tr>
                    <td class="borderAll center">do 3 miesięcy</td>
                    <td class="borderAll center">suma powyżej 3 miesięcy </td>
                    <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
                    <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
                    <td class="borderAll center">suma powyżej 12 miesięcy </td>
                    <td class="borderAll center">powyżej 12 miesięcy do 2 lat </td>
                    <td class="borderAll center">powyżej 2 do 3 lat </td>
                    <td class="borderAll center">suma powyżej 3 lat </td>
                    <td class="borderAll center">powyżej 3 do 5 lat </td>
                    <td class="borderAll center">powyżej 5 do 8 lat </td>
                    <td class="borderAll center">ponad 8 lat </td>
                </tr>
                <tr>
                    <td class="borderAll col_88 wciecie">C</td>
                                      <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c01"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c02"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c03"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c04"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c05"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c06"  runat="server" Text="0"></asp:Label></a></td>

                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c07"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!8!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c08"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!9!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c09"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!10!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c10"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!11!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c11"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=1!7!12!3')"><asp:Label CssClass="normal" ID="tab_07_w01_c12"  runat="server" Text="0"></asp:Label></a></td>
  	
                </tr>
                <tr>
                    <td class="borderAll col_88 wciecie">Ns</td>
                                      <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!1!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c01"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c02"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c03"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c04"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c05"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c06"  runat="server" Text="0"></asp:Label></a></td>

                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c07"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!8!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c08"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!9!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c09"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!10!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c10"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!11!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c11"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=2!7!12!3')"><asp:Label CssClass="normal" ID="tab_07_w02_c12"  runat="server" Text="0"></asp:Label></a></td>
  	            </tr>
                <tr>
                    <td class="borderAll col_88 wciecie">Co</td>
                                                      <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!1!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c01"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!2!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c02"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!3!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c03"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!4!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c04"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!5!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c05"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!6!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c06"  runat="server" Text="0"></asp:Label></a></td>

                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!7!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c07"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!8!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c08"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!9!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c09"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!10!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c10"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!11!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c11"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=3!7!12!3')"><asp:Label CssClass="normal" ID="tab_07_w03_c12"  runat="server" Text="0"></asp:Label></a></td>
  	    </tr>
                <tr>
                    <td class="borderAll col_88 wciecie">Nc</td>
                                          <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!1!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c01"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!2!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c02"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!3!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c03"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!4!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c04"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!5!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c05"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!6!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c06"  runat="server" Text="0"></asp:Label></a></td>

                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!7!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c07"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!8!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c08"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!9!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c09"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!10!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c10"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!11!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c11"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=4!7!12!3')"><asp:Label CssClass="normal" ID="tab_07_w04_c12"  runat="server" Text="0"></asp:Label></a></td>
  	            </tr>
                <tr>
                    <td class="borderAll col_88 wciecie">Ops</td>
                                            <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!1!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c01"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!2!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c02"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!3!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c03"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!4!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c04"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!5!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c05"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!6!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c06"  runat="server" Text="0"></asp:Label></a></td>

                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!7!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c07"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!8!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c08"  runat="server" Text="0"></asp:Label></a></td>
                  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!9!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c09"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!10!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c10"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!11!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c11"  runat="server" Text="0"></asp:Label></a></td>
  		  <td class="borderAll center col_88"><a href="javascript:openPopup('popup.aspx?sesja=5!7!12!3')"><asp:Label CssClass="normal" ID="tab_07_w05_c12"  runat="server" Text="0"></asp:Label></a></td>
  	          </tr>
            </table>

  
    

        <br />
  
    

    </div>


        <div id="Div8"  class="page-break"> 
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

    <div id="debag" >
          <br />
    <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
    
 
    <br />
       
  </div>

  
</asp:Content>

