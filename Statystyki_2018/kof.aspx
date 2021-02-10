<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kof.aspx.cs" Inherits="Statystyki_2018.kof"  MaintainScrollPositionOnPostback="true"%>


<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dataBar"> 
    <div class="noprint" >
      <div  class="manu_back">
                  
   <table class="tbl_manu">

        <tr>
           
            <td >
           
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="3">Wpisy do uzupełnienia</asp:ListItem>
                    <asp:ListItem Value="1">Wszystkie wpisy</asp:ListItem>
                    <asp:ListItem Value="2">Wpisy uzupełnione</asp:ListItem>
                </asp:DropDownList>
                 </td>
              <td >


                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ax_box" OnClick="importujDaneKOF">Odśwież</asp:LinkButton>


                  </td>
        </tr>
    
    </table>
    </div>
      </div>
     </div>

    <br />
    <br />
    <br />
    <br />
    <div>

        <asp:Panel ID="edytowalny" runat="server">

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="kofSQL" EnableTheming="True" KeyFieldName="ident" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Office2003Blue" ViewStateMode="Enabled" Width="100%">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsText CommandCancel="Anuluj" CommandEdit="Uzupełnij numer of" CommandUpdate="Zapisz" PopupEditFormCaption="Wprowadz numer of" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem Caption="Id sprawy" ClientVisible="False" ColumnName="id_sprawy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem Caption="Numer of" ColumnName="numer_of">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Button" ButtonType="Button" ShowClearFilterButton="True" ShowEditButton="True" VisibleIndex="0" Width="60px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Id Sprawy" FieldName="id_sprawy" VisibleIndex="2" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Wydział" FieldName="wydzial" VisibleIndex="3" Width="80px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="sygnatura" VisibleIndex="4" Width="80px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="d_wplywu" VisibleIndex="5" Width="60px">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Strona" FieldName="strona" VisibleIndex="6">
                     <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
           
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pełnomocnik" FieldName="pelnomocnik" VisibleIndex="7">
                     <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
           
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Przeciwko" FieldName="przeciwko" VisibleIndex="8">
                <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Numer of" FieldName="numer_of" VisibleIndex="9" Width="80px">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="kofSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ident, id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko, numer_of FROM kof WHERE (numer_of IS NULL)" UpdateCommand="UPDATE kof SET numer_of = @numer WHERE (id_sprawy = @id)">
        <UpdateParameters>
            <asp:Parameter Name="numer" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="wypełniony" runat="server" Visible="False">

               <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="kof2" EnableTheming="True" KeyFieldName="ident" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Office2003Blue" ViewStateMode="Enabled" Width="100%">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsText CommandCancel="Anuluj" CommandEdit="Uzupełnij numer of" CommandUpdate="Zapisz" PopupEditFormCaption="Wprowadz numer of" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem Caption="Id sprawy" ClientVisible="False" ColumnName="id_sprawy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem Caption="Numer of" ColumnName="numer_of">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Button" VisibleIndex="0" Width="60px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Id Sprawy" FieldName="id_sprawy" VisibleIndex="2" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Wydział" FieldName="wydzial" VisibleIndex="3" Width="80px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="sygnatura" VisibleIndex="4" Width="80px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="d_wplywu" VisibleIndex="5" Width="60px">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Strona" FieldName="strona" VisibleIndex="6">
                             <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
        
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pełnomocnik" FieldName="pelnomocnik" VisibleIndex="7">
                             <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
        
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Przeciwko" FieldName="przeciwko" VisibleIndex="8">
                             <PropertiesTextEdit EncodeHtml="true" ></PropertiesTextEdit>
        
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Numer of" FieldName="numer_of" VisibleIndex="9" Width="80px">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="kof2" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ident, id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko, numer_of FROM kof WHERE (numer_of IS NOT NULL)" UpdateCommand="UPDATE kof SET numer_of = @numer WHERE (id_sprawy = @id)">
        <UpdateParameters>
            <asp:Parameter Name="numer" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>


        </asp:Panel>

         <asp:Panel ID="wszystko" runat="server" Visible="False">

               <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="kof3" EnableTheming="True" KeyFieldName="ident" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Office2003Blue" ViewStateMode="Enabled" Width="100%">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsText CommandCancel="Anuluj" CommandEdit="Uzupełnij numer of" CommandUpdate="Zapisz" PopupEditFormCaption="Wprowadz numer of" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem Caption="Id sprawy" ClientVisible="False" ColumnName="id_sprawy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem Caption="Numer of" ColumnName="numer_of">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Button" ButtonType="Button" ShowClearFilterButton="True" ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Id Sprawy" FieldName="id_sprawy" VisibleIndex="2" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Wydział" FieldName="wydzial" VisibleIndex="3" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="sygnatura" VisibleIndex="4" Width="80px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="d_wplywu" VisibleIndex="5" Width="60px">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Strona" FieldName="strona" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pełnomocnik" FieldName="pelnomocnik" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Przeciwko" FieldName="przeciwko" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Numer of" FieldName="numer_of" VisibleIndex="9" Width="60px">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="kof3" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT * FROM [kof]" UpdateCommand="UPDATE kof SET numer_of = @numer WHERE (id_sprawy = @id)">
        <UpdateParameters>
            <asp:Parameter Name="numer" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>


        </asp:Panel>

        <asp:Label ID="LogLabel" runat="server"></asp:Label>


</div>
</asp:Content>
