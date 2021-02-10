<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wyszukiwarkaspraw.aspx.cs" Inherits="Statystyki_2018.wyszukiwarka2" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 

      <div class="noprint" style="margin-left:auto; margin-right :auto;">
        <div id="menu" style="background-color: #f7f7f7;">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position:relative;  width: 1050px;    left: 0px;">
      
            
            
            <table width="100%">
                <tr>
                    <td style="width:150px">Rodzaj wyszukiwania :</td>
                    <td style="width: 5px"></td>
                    <td style="width: 5px">
                        
                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ClientInstanceName="comboBox" Width="150px" Theme="Moderno">            </dx:ASPxComboBox>
                        
                    </td>
                    <td style="width: 50px"></td>
                    <td style="padding: 4px; width:65px"> Nazwisko :</td>
                    <td  style="width: 5px"></td>
                    <td style="width: 5px">
                        <asp:TextBox ID="Nazwisko" runat="server"></asp:TextBox>
                    </td>
                    <td  style="width: 30px"></td>
                    <td style="width: 45px">Imię :</td>
                    <td  style="width: 5px"></td>
                    <td>
                        <asp:TextBox ID="imie" runat="server" Width="120px"></asp:TextBox>
                    </td>
                    <td style="width: 5px">  </td>
                    <td align="right" style="width: 60px"> 
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn_search" OnClick="LinkButton2_Click" Width="60px">Drukuj</asp:LinkButton>
                    </td>
                    <td  style="width: 20px" align="right"> </td>
                    <td align="right" style="width: 60px">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_search" OnClick="szukaj" Width="60px">Szukaj</asp:LinkButton>
                    </td>
                </tr>

            </table>
            </div>
                           
        </div>
    </div>



    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;">
      
        <!-- content Table  -->
        <div style="margin-top:20px">
           <dx:ASPxGridView ID="listaSpraw" runat="server" DataSourceID="SqlDataSource1" EnableCallbackAnimation="True" OnLoad="Grid_Load" EnableTheming="True" Theme="Aqua" Width="100%">
                <SettingsPager PageSize="50">
                </SettingsPager>
                <Settings ShowGroupButtons="False" />
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsSearchPanel Visible="True" />
                <SettingsText EmptyDataRow="Brak danych" SearchPanelEditorNullText="Proszę wpisać szukany tekst" />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" CancelSelectOnNullParameter="False"></asp:SqlDataSource>

            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="listaSpraw" PaperKind="A4">
            </dx:ASPxGridViewExporter>

       </div>

</div>
      <asp:Label ID="Label1" runat="server"></asp:Label>





</asp:Content>

