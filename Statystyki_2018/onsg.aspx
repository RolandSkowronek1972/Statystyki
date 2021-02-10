<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onsg.aspx.cs" Inherits="Statystyki_2018.onsg" %>


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
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" OnClick="LinkButton55_Click" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                
                <asp:LinkButton ID="LinkButton56" runat="server" OnClick="Button1_Click" CssClass="ax_box" Visible="False">DRUKUJ</asp:LinkButton>
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
     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">  
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div> 
  

         <asp:Label ID="Label5" runat="server"></asp:Label>
  

         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dane_do_tabeli_1" 
        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15,id_tabeli" OnRowCreated="GridView2_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
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
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')"><asp:Label ID="Label14" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
                   </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')"><asp:Label ID="Label15"  runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')"><asp:Label ID="Label16"  runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
              </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')"><asp:Label ID="Label17"  runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                      
                </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!8!1"%>')"><asp:Label ID="Label18"  runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
                         </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!9!1"%>')"><asp:Label ID="Label19"  runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                         </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
  
    

    <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
     </div>
   <div id="zalatwienia"  class="page-break"> 
    <br />
    


    <asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_2" 
        Width="100%" ShowHeader="False" OnRowCreated="GridView1_RowCreated">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="nazwisko_bez_funkcji" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
        
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_92" />
            </asp:TemplateField>
           
             
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_2" runat="server" 
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
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" Width="100%" ShowHeader="False" OnRowCreated="GridView3_RowCreated">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="nazwisko_bez_funkcji" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label306" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label307" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label308" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label309" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label310" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
        </Columns>
        <RowStyle Height="25px" />
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

       <div  class="page-break"> 
           <asp:label runat="server" ID="Label6"></asp:label>


           <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_4" Width="100%" ShowHeader="False" OnRowCreated="GridView4_RowCreated">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
                <ItemTemplate>
                    <asp:Label ID="Label31" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label32" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="nazwisko_bez_funkcji" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label406" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label407" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label408" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label409" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label410" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
      
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label411" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
      
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label412" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label413" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
       
       
       
            
        </Columns>
    </asp:GridView>
           <br />
    <asp:SqlDataSource ID="tabela_4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
       

 
       </div>
       <div  class="page-break"> 




        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_5"  Width="100%" ShowHeader="False" OnRowCreated="GridView6_RowCreated">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label33" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label34" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="nazwisko_bez_funkcji" />
            </asp:TemplateField>
           
                     <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label501" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label502" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label503" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label504" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label505" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label506" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label507" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label508" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label509" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_103" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label510" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                    </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label511" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
               </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label512" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
             </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label513" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
        
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label514" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label515" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
      
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label516" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
      
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label517" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
      
                  <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label518" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a>
                
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
      
      
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 5) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
       </div>
           <div  class="page-break"> 
               &nbsp;<asp:Label ID="infoLabel6" runat="server"></asp:Label>

               <br />
               <table style="width:100%;">
                   <tr>
                       <td class="borderAll center col_20">Miesiąc</td>
                       <td class="borderAll center col_20" colspan="22">liczba spraw ( w tym zawieszone) </td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">&nbsp;</td>
                       <td class="borderAll center col_20" colspan="2">do 3 miesięcy</td>
                       <td class="borderAll center col_20" colspan="2">suma powyżej 3 miesięcy</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 3 do 6 miesięcy</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 6 do 12 miesięcy</td>
                       <td class="borderAll center col_20" colspan="2">suma powyżej 12 miesięcy</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 12 miesięcy do 2 lat</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 2 do 3 lat</td>
                       <td class="borderAll center col_20" colspan="2">suma powyżej 3 lat</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 3 do 5 lat</td>
                       <td class="borderAll center col_20" colspan="2">powyżej 5 do 8 lat</td>
                       <td class="borderAll center col_20" colspan="2">ponad 8 lat</td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">GC i GCupr</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!1!3')"><asp:Label ID="tab_06_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!2!3')"><asp:Label ID="tab_06_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!3!3')"><asp:Label ID="tab_06_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!4!3')"><asp:Label ID="tab_06_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!5!3')"><asp:Label ID="tab_06_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!6!3')"><asp:Label ID="tab_06_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!7!3')"><asp:Label ID="tab_06_w01_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!8!3')"><asp:Label ID="tab_06_w01_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!9!3')"><asp:Label ID="tab_06_w01_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!10!3')"><asp:Label ID="tab_06_w01_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!11!3')"><asp:Label ID="tab_06_w01_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!12!3')"><asp:Label ID="tab_06_w01_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!13!3')"><asp:Label ID="tab_06_w01_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!14!3')"><asp:Label ID="tab_06_w01_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!15!3')"><asp:Label ID="tab_06_w01_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!16!3')"><asp:Label ID="tab_06_w01_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!17!3')"><asp:Label ID="tab_06_w01_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!18!3')"><asp:Label ID="tab_06_w01_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!19!3')"><asp:Label ID="tab_06_w01_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!20!3')"><asp:Label ID="tab_06_w01_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!21!3')"><asp:Label ID="tab_06_w01_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=1!6!22!3')"><asp:Label ID="tab_06_w01_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">GNs</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!1!3')"><asp:Label ID="tab_06_w02_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!2!3')"><asp:Label ID="tab_06_w02_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!3!3')"><asp:Label ID="tab_06_w02_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!4!3')"><asp:Label ID="tab_06_w02_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!5!3')"><asp:Label ID="tab_06_w02_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!6!3')"><asp:Label ID="tab_06_w02_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!7!3')"><asp:Label ID="tab_06_w02_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!8!3')"><asp:Label ID="tab_06_w02_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!9!3')"><asp:Label ID="tab_06_w02_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!10!3')"><asp:Label ID="tab_06_w02_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!11!3')"><asp:Label ID="tab_06_w02_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!12!3')"><asp:Label ID="tab_06_w02_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!13!3')"><asp:Label ID="tab_06_w02_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!14!3')"><asp:Label ID="tab_06_w02_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!15!3')"><asp:Label ID="tab_06_w02_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!16!3')"><asp:Label ID="tab_06_w02_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!17!3')"><asp:Label ID="tab_06_w02_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!18!3')"><asp:Label ID="tab_06_w02_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!19!3')"><asp:Label ID="tab_06_w02_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!20!3')"><asp:Label ID="tab_06_w02_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!21!3')"><asp:Label ID="tab_06_w02_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=2!6!22!3')"><asp:Label ID="tab_06_w02_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">GNc</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!1!3')"><asp:Label ID="tab_06_w03_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!2!3')"><asp:Label ID="tab_06_w03_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!3!3')"><asp:Label ID="tab_06_w03_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!4!3')"><asp:Label ID="tab_06_w03_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!5!3')"><asp:Label ID="tab_06_w03_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!6!3')"><asp:Label ID="tab_06_w03_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!7!3')"><asp:Label ID="tab_06_w03_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!8!3')"><asp:Label ID="tab_06_w03_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!9!3')"><asp:Label ID="tab_06_w03_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!10!3')"><asp:Label ID="tab_06_w03_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!11!3')"><asp:Label ID="tab_06_w03_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!12!3')"><asp:Label ID="tab_06_w03_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!13!3')"><asp:Label ID="tab_06_w03_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!14!3')"><asp:Label ID="tab_06_w03_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!15!3')"><asp:Label ID="tab_06_w03_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!16!3')"><asp:Label ID="tab_06_w03_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!17!3')"><asp:Label ID="tab_06_w03_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!18!3')"><asp:Label ID="tab_06_w03_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!19!3')"><asp:Label ID="tab_06_w03_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!20!3')"><asp:Label ID="tab_06_w03_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!21!3')"><asp:Label ID="tab_06_w03_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=3!6!22!3')"><asp:Label ID="tab_06_w03_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">GCo</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!1!3')"><asp:Label ID="tab_06_w04_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!2!3')"><asp:Label ID="tab_06_w04_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!3!3')"><asp:Label ID="tab_06_w04_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!4!3')"><asp:Label ID="tab_06_w04_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!5!3')"><asp:Label ID="tab_06_w04_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!6!3')"><asp:Label ID="tab_06_w04_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!7!3')"><asp:Label ID="tab_06_w04_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!8!3')"><asp:Label ID="tab_06_w04_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!9!3')"><asp:Label ID="tab_06_w04_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!10!3')"><asp:Label ID="tab_06_w04_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!11!3')"><asp:Label ID="tab_06_w04_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!12!3')"><asp:Label ID="tab_06_w04_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!13!3')"><asp:Label ID="tab_06_w04_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!14!3')"><asp:Label ID="tab_06_w04_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!15!3')"><asp:Label ID="tab_06_w04_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!16!3')"><asp:Label ID="tab_06_w04_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!17!3')"><asp:Label ID="tab_06_w04_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!18!3')"><asp:Label ID="tab_06_w04_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!19!3')"><asp:Label ID="tab_06_w04_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!20!3')"><asp:Label ID="tab_06_w04_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!21!3')"><asp:Label ID="tab_06_w04_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=4!6!22!3')"><asp:Label ID="tab_06_w04_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">GCps</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!1!3')"><asp:Label ID="tab_06_w05_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!2!3')"><asp:Label ID="tab_06_w05_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!3!3')"><asp:Label ID="tab_06_w05_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!4!3')"><asp:Label ID="tab_06_w05_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!5!3')"><asp:Label ID="tab_06_w05_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!6!3')"><asp:Label ID="tab_06_w05_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!7!3')"><asp:Label ID="tab_06_w05_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!8!3')"><asp:Label ID="tab_06_w05_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!9!3')"><asp:Label ID="tab_06_w05_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!10!3')"><asp:Label ID="tab_06_w05_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!11!3')"><asp:Label ID="tab_06_w05_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!12!3')"><asp:Label ID="tab_06_w05_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!13!3')"><asp:Label ID="tab_06_w05_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!14!3')"><asp:Label ID="tab_06_w05_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!15!3')"><asp:Label ID="tab_06_w05_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!16!3')"><asp:Label ID="tab_06_w05_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!17!3')"><asp:Label ID="tab_06_w05_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!18!3')"><asp:Label ID="tab_06_w05_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!19!3')"><asp:Label ID="tab_06_w05_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!20!3')"><asp:Label ID="tab_06_w05_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!21!3')"><asp:Label ID="tab_06_w05_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=5!6!22!3')"><asp:Label ID="tab_06_w05_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_20">RAZEM</td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!1!3')"><asp:Label ID="tab_06_w06_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!2!3')"><asp:Label ID="tab_06_w06_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!3!3')"><asp:Label ID="tab_06_w06_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!4!3')"><asp:Label ID="tab_06_w06_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!5!3')"><asp:Label ID="tab_06_w06_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!6!3')"><asp:Label ID="tab_06_w06_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!7!3')"><asp:Label ID="tab_06_w06_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!8!3')"><asp:Label ID="tab_06_w06_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!9!3')"><asp:Label ID="tab_06_w06_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!10!3')"><asp:Label ID="tab_06_w06_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!11!3')"><asp:Label ID="tab_06_w06_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!12!3')"><asp:Label ID="tab_06_w06_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!13!3')"><asp:Label ID="tab_06_w06_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!14!3')"><asp:Label ID="tab_06_w06_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!15!3')"><asp:Label ID="tab_06_w06_c15" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!16!3')"><asp:Label ID="tab_06_w06_c16" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!17!3')"><asp:Label ID="tab_06_w06_c17" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!18!3')"><asp:Label ID="tab_06_w06_c18" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!19!3')"><asp:Label ID="tab_06_w06_c19" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!20!3')"><asp:Label ID="tab_06_w06_c20" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!21!3')"><asp:Label ID="tab_06_w06_c21" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                     <td class="borderAll center col_75"> <a href="javascript:openPopup('popup.aspx?sesja=6!6!22!3')"><asp:Label ID="tab_06_w06_c22" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
               </table>

               </div>
               <div  class="page-break"> 

 
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

