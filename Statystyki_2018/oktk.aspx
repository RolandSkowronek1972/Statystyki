<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oktk.aspx.cs" Inherits="Statystyki_2018.oktk" %>

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

          <div id="tabela1"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="id_dzialu" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; " class="auto-style3"> 
             <asp:label runat="server" ID="Label3" Visible="False"></asp:label>
    <asp:SqlDataSource ID="tabela_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, d_30, d_31, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 1) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
              </div> 
    


    <asp:Label ID="tabela1Label" runat="server"></asp:Label>
       &nbsp;<asp:Label ID="infoLabel3" runat="server" Text="Tabela 1 \/" Visible="False"></asp:Label>
     
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_1" OnRowCreated="GridView1_RowCreated" 
        Width="100%" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True">
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
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>
        
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_37" />
            </asp:TemplateField>

              

        
<asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
             
        </Columns>
           <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
    </asp:GridView>
     </div>



   <div id="zalatwienia"  class="page-break"> 
       <br />
    


    <asp:Label ID="tabela2Label" runat="server"></asp:Label>
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
    <br />
       </div>
    
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000" rowspan="2">Kategorie spraw</td>
                <td colspan="2" align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">K<br />
                </td>
                <td class="col_72" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">Kp</td>
                <td class="col_72" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">Ko</td>
                <td class="col_72" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">Kop</td>
                <td class="col_72" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">W</td>
                <td class="col_72" rowspan="2" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000; background-color: #C0C0C0;">Razem</td>
            </tr>
            <tr>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">Ogółem</td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000">w tym sprawy zawieszone (K-niezakreślone) </td>
            </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">Pozostało z okresu poprzedniego</td>
                <td class="col_72 mssGrayMiddle " style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col02" runat="server" Text="0"></asp:Label></a> </td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=1!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w01_col07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">Wpływ spraw</td>
                <td class="col_72 mssGrayMiddle " style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: 0px solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72 mssGrayMiddle" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=2!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w02_col07" runat="server" Text="0"></asp:Label></a></td>
                 </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">Załatwień</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=3!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=3!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w03_col07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">Pozostało na okres następny</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=4!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w04_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=4!2!1!7')"><asp:Label CssClass="normal" ID="tab_1_w04_col07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td rowspan="7" align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333; width: 258px;">Zaległości</td>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333; width: 258px;" class="wciecie">pow. 3-6 miesięcy</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=5!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=5!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w05_col07" runat="server" Text="0"></asp:Label></a></td>
         
                       </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">pow. 6-12 miesięcy</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=6!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=6!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w06_col07" runat="server" Text="0"></asp:Label></a></td>
         
                   </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">pow.12 miesięcy do 2 lat</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=7!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=7!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w07_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">pow. 2 do 3 lat</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=8!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=8!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w08_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">pow. 3 do 5 lat</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=9!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=9!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w09_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">pow. 5 do 8 lat</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=10!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=10!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w10_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">ponad 8 lat</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333"><a href="javascript:openPopup('popup.aspx?sesja=11!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; height: 19px; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=11!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w11_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333" class="wciecie">kontrolka &quot;Zpk&quot; - dokonane wpisy do 31.12.2003 roku - ilość niezakreślonych pozycji</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-left: thin solid #333333; border-right: thin solid #333333; border-top: thin solid #333333; border-bottom: 0px solid #333333; background-color: #CCCCCC; height: 19px;"><a href="javascript:openPopup('popup.aspx?sesja=12!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w12_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            <tr>
                <td colspan="2" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;" class="wciecie">kontrolka &quot;Zpk&quot; - dokonane wpisy od 01.1.2004 roku - ilość niezakreślonych pozycji</td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!1!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_140" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;text-decoration: line-through"><a href="javascript:openPopup('popup.aspx?sesja=13!2!2!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!3!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!4!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!5!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin 0px thin thin; border-color: #333333;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!6!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_72" style="border-style: solid; border-width: thin; border-color: #333333; background-color: #CCCCCC;"><a href="javascript:openPopup('popup.aspx?sesja=13!2!7!1')"><asp:Label CssClass="normal" ID="tab_1_w13_col07" runat="server" Text="0"></asp:Label></a></td>

            </tr>
            </table>
    
    <br />

    <div id="debag" >
          <br />
     <br />
        Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
          &nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
          <asp:Label ID="Label30" runat="server"></asp:Label>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
    
 
    <br />
       
  </div>

    
</asp:Content>

