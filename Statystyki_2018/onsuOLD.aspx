<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onsuOLD.aspx.cs" Inherits="Statystyki_2018.onsuOLD" MaintainScrollPositionOnPostback="true" %>


<%@ Register src="UserControlls/PopupLinkButtom.ascx" tagname="PopupLinkButtom" tagprefix="uc1" %>

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
  

         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        onrowcreated="GridView2_RowCreated" DataSourceID="dane_do_tabeli_1" 
        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom101" runat="server" info='<%# Eval("d_01")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#01#1#"+Eval("id_")%>' />  
               </ItemTemplate>
  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom102" runat="server" info='<%# Eval("d_02")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#02#1#"+Eval("id_")%>' />  
                </ItemTemplate>
            <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom103" runat="server" info='<%# Eval("d_03")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#03#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom104" runat="server" info='<%# Eval("d_04")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#04#1#"+Eval("id_")%>' />  
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                   <uc1:PopupLinkButtom ID="PopupLinkButtom105" runat="server" info='<%# Eval("d_05")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#05#1#"+Eval("id_")%>' />  
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom106" runat="server" info='<%# Eval("d_06")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#06#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
           

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                   <uc1:PopupLinkButtom ID="PopupLinkButtom107" runat="server" info='<%# Eval("d_07")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#07#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                       <uc1:PopupLinkButtom ID="PopupLinkButtom108" runat="server" info='<%# Eval("d_08")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#08#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom109" runat="server" info='<%# Eval("d_09")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#09#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom110" runat="server" info='<%# Eval("d_10")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#10#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                       <uc1:PopupLinkButtom ID="PopupLinkButtom111" runat="server" info='<%# Eval("d_11")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#11#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom101" runat="server" info='<%# Eval("d_12")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#12#1#"+Eval("id_")%>' />  
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
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
        DataSourceID="statystyki" OnRowCreated="GridView1_RowCreated" 
        Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
          
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton18" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 1 %>" CssClass="normal" Text='<%# Eval("d_01") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton19" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 2 %>" CssClass="normal" Text='<%# Eval("d_02") %>' OnCommand="show"></asp:LinkButton>
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton20" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 3 %>" CssClass="normal" Text='<%# Eval("d_03") %>' OnCommand="show"></asp:LinkButton>
                
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                         <asp:LinkButton ID="LinkButton21" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 4 %>" CssClass="normal" Text='<%# Eval("d_04") %>' OnCommand="show"></asp:LinkButton>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                          <asp:LinkButton ID="LinkButton22" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 5 %>" CssClass="normal" Text='<%# Eval("d_05") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                         <asp:LinkButton ID="LinkButton23" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 6 %>" CssClass="normal" Text='<%# Eval("d_06") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton24" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 7 %>" CssClass="normal" Text='<%# Eval("d_07") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton12" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 8 %>" CssClass="normal" Text='<%# Eval("d_08") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton13" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 9 %>" CssClass="normal" Text='<%# Eval("d_09") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton14" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 10 %>" CssClass="normal" Text='<%# Eval("d_10") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton35" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 11 %>" CssClass="normal" Text='<%# Eval("d_11") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton36" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 12 %>" CssClass="normal" Text='<%# Eval("d_12") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton37" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 13 %>" CssClass="normal" Text='<%# Eval("d_13") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton38" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 14 %>" CssClass="normal" Text='<%# Eval("d_14") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton39" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 15 %>" CssClass="normal" Text='<%# Eval("d_15") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <asp:LinkButton ID="LinkButton45" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 16 %>" CssClass="normal" Text='<%# Eval("d_16") %>' OnCommand="show"></asp:LinkButton>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_82" />
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
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" onrowcreated="GridView3_RowCreated" Width="100%" ShowHeader="False">
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
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("d_01") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton40" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 1 %>" CssClass="normal" Text='<%# Eval("d_01") %>' OnCommand="show2"></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton41" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 2 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_02") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
             
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton42" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 3 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_03") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton43" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 4 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_04") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton44" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 5 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_05") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>
           
              <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton2" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 6 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_06") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton15" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 7 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_07") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton46" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 8 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_08") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton52" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 9 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_09") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton69" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 10 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_10") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton70" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 11 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_11") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton71" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 12 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_12") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton72" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 13 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_13") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton73" runat="server"  CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 14 %>" CssClass="normal" OnCommand="show2" Text='<%# Eval("d_14") %>'></asp:LinkButton>
                </ItemTemplate>
              <ItemStyle cssclass="col_117" />
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
    <div id="Div1"  class="page-break"> 
    &nbsp;<asp:Label ID="Label15" runat="server"></asp:Label>
        &nbsp; &nbsp;<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_4" onrowcreated="GridView4_RowCreated" Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
          
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t4_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("d_01") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton47" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 1 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_01") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("d_02") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton48" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 2 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_02") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("d_03") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton49" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 3 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_03") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("d_04") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton50" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 4 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_04") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("d_05") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton51" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 5 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_05") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox35" runat="server" Text='<%# Bind("d_07") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                     <asp:LinkButton ID="LinkButton53" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 6 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_06") %>'></asp:LinkButton>
                     
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_08" SortExpression="d_08">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="d_08" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton29" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 7 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_07") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>
            
            
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton30" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 8 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_08") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton74" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 9 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_09") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton91" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 10 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_10") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton92" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 11 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_11") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton93" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 12 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_12") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton94" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 13 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_13") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton95" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 14 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_14") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_103" />
            </asp:TemplateField>



        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />

         </div>
        <div id="Div6"  class="page-break"> 

        <asp:Label ID="Label34" runat="server"></asp:Label>
            <br />
        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_5" onrowcreated="GridView6_RowCreated" Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label31" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label32" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t4_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox37" runat="server" Text='<%# Bind("d_01") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton59" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 1 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_01") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton60" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 2 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_02") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton61" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 3 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_03") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton62" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 4 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_04") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("d_05") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton63" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 5 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_05") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("d_07") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                     <asp:LinkButton ID="LinkButton64" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 6 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_06") %>'></asp:LinkButton>
                     
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_08" SortExpression="d_08">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="d_08" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton65" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 7 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_07") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl8" runat="server" DataField="d_09" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    
                        <asp:LinkButton ID="LinkButton66" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 8 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_08") %>'></asp:LinkButton>        
                   

                
                </ItemTemplate>
                 <ItemStyle cssclass="col_68"/>
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl9" runat="server" DataField="d_09" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    
                        <asp:LinkButton ID="LinkButton67" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 9 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_09") %>'></asp:LinkButton>        
                   

                
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton68" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 10 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_10") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 11 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_11") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton9" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 12 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_12") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
           
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton96" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 13 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_13") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton97" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 14 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_14") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton98" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 15 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_15") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton99" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 16 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_16") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton100" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 17 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_17") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>

              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton101" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 18 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_18") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_68" />
            </asp:TemplateField>

           



        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 5) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
  

        <br />
         </div>
        <div id="Div7"  class="page-break"> 
        <asp:Label ID="Label35" runat="server"></asp:Label>
  

            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_6" Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label38" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label39" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t4_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("d_01") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton81" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 1 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_01") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton82" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 2 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_02") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton83" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 3 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_03") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton84" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 4 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_04") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox45" runat="server" Text='<%# Bind("d_05") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton85" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 5 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_05") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox46" runat="server" Text='<%# Bind("d_07") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                     <asp:LinkButton ID="LinkButton86" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 6 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_06") %>'></asp:LinkButton>
                     
                </ItemTemplate>
                 <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_08" SortExpression="d_08">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl10" runat="server" DataField="d_08" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton87" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 7 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_07") %>'></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle cssclass="col_82" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl11" runat="server" DataField="d_09" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    
                        <asp:LinkButton ID="LinkButton88" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 8 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_08") %>'></asp:LinkButton>        
                   

                
                </ItemTemplate>
                 <ItemStyle cssclass="col_82"/>
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <EditItemTemplate>
                    <asp:DynamicControl ID="DynamicControl12" runat="server" DataField="d_09" Mode="Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    
                        <asp:LinkButton ID="LinkButton89" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 9 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_09") %>'></asp:LinkButton>        
                   

                
                </ItemTemplate>
                 <ItemStyle cssclass="col_82" />
            </asp:TemplateField>

             <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                        <asp:LinkButton ID="LinkButton90" runat="server" CommandArgument='<%# Eval("id_sedziego") %>' CommandName="<%# 10 %>" CssClass="normal" OnCommand="show3" Text='<%# Eval("d_10") %>'></asp:LinkButton>        
                </ItemTemplate>
                 <ItemStyle cssclass="col_82" />
            </asp:TemplateField>



           



        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 6) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
  


        <br />
  
    

    </div>

        <div id="Div9"  class="page-break"> 
        <asp:Label ID="Label36" runat="server"></asp:Label>
  

            Struktura pozostałości (wydział ogółem – liczba spraw)<asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataSourceID="dane_do_tabeli_7" 
        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
                    <asp:Label ID="Label37" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton75" runat="server" CommandArgument='<%# Eval("id_") %>' 
                        CommandName="<%# 1 %>" Text='<%# Eval("d_01") %>' CssClass="normal" OnCommand='LinkButton1_Command'></asp:LinkButton>
               </ItemTemplate>
  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton76" runat="server" CommandArgument='<%# Eval("id_") %>' 
                        CommandName="<%# 2 %>" CssClass="normal"  Text='<%# Eval("d_02") %> ' OnCommand='LinkButton1_Command' ></asp:LinkButton>
                </ItemTemplate>
            <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton77" runat="server" CommandArgument='<%# Eval("id_") %>' 
                        CommandName="<%# 3 %>" CssClass="normal"  Text='<%# Eval("d_03") %> ' OnCommand='LinkButton1_Command' ></asp:LinkButton>
                  
                </ItemTemplate>
                  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton78" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 4 %>"  CssClass="normal"  Text='<%# Eval("d_04") %>'  OnCommand='LinkButton1_Command'></asp:LinkButton>
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton79" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 5 %>"  CssClass="normal"  Text='<%# Eval("d_05") %>' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton80" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 6 %>"  CssClass="normal"  Text='<%# Eval("d_06") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton10" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 7 %>"  CssClass="normal"  Text='<%# Eval("d_07") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton11" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 8 %>"  CssClass="normal"  Text='<%# Eval("d_08") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton16" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 9 %>"  CssClass="normal"  Text='<%# Eval("d_09") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton17" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 10 %>"  CssClass="normal"  Text='<%# Eval("d_10") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton25" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 11 %>"  CssClass="normal"  Text='<%# Eval("d_11") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton26" runat="server" CommandArgument='<%# Eval("id_") %>' CommandName="<%# 12 %>"  CssClass="normal"  Text='<%# Eval("d_12") %> ' OnCommand='LinkButton1_Command'></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_68" />
            </asp:TemplateField>
           
        </Columns>
    </asp:GridView>
  
    

        <br />
  
    

    <asp:SqlDataSource ID="dane_do_tabeli_7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15 FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 7) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
       

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

    <asp:Panel ID="Panel4" runat="server" CssClass="Panel_2_2" Visible="False">
        <br />
          <br />
          <br />
        <asp:Panel ID="Panel5" runat="server" CssClass="Panel_1_1" ViewStateMode="Enabled">
            <table width="100%" class="manu_back2">
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="Label" CssClass="normal" Font-Bold="True" ForeColor="Black"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </td>
                    
                    <td align="right">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/zamknij.jpg" 
                            onclick="ImageButton1_Click" Height="32px" Width="32px" />
                    </td>
                </tr>
            </table>

<asp:Panel runat="server" ID="px" Height="390px" ScrollBars="Auto" CssClass="manu_back2">


            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"  GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#656565" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            

</asp:Panel>
         </asp:Panel>
        <br />
        <br />
        <br />
    </asp:Panel>
</asp:Content>


