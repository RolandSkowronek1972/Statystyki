<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="Statystyki_2018.adm" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="UserControlls/ZarzadzanieFormularzami.ascx" TagName="ZarzadzanieFormularzami" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .butn1 {
            background-position: 0% 0%;
            background-image: linear-gradient(to bottom, #F6D014, #D04411) !important;
            -webkit-border-radius: 6px !important;
            -moz-border-radius: 6px !important;
            border-radius: 6px !important;
            height: 10px !important;
            line-height: 10px !important;
            color: #FFFFFF !important;
            font-family: Open Sans !important;
            width: 129px !important;
            font-size: 20px !important;
            font-weight: 200 !important;
            padding: 13px !important;
            text-shadow: 1px 1px 20px #000000 !important;
            border: solid #FFFFFF 1px !important;
            text-decoration: none !important;
            display: inline-block !important;
            cursor: pointer !important;
            background-color: #F6D014 !important;
            background-repeat: repeat !important;
            background-attachment: scroll !important;
        }

            .butn1:hover {
                background-position: 0% 0%;
                background-image: linear-gradient(to bottom, #F6D014, #F6450F) !important;
                text-decoration: none !important;
                background-color: #F6D014 !important;
                background-repeat: repeat !important;
                background-attachment: scroll !important;
            }
        .auto-style1 {
            height: 83px;
        }
    </style>
    <dx:ASPxGridView ID="grid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ident" Theme="Moderno" Width="100%" OnStartRowEditing="startEdycji" OnInitNewRow="startWprowadzaniaUzytkownika" OnRowInserting="wprowadzanieDoBazyDanychnowegoUsera" OnRowDeleting="grid1_RowDeleting" OnRowUpdated="poEdycji">
        <SettingsPager PageSize="30">
        </SettingsPager>
        <SettingsEditing Mode="EditForm">
        </SettingsEditing>
        <SettingsCommandButton>
            <EditButton Text="Edytuj"></EditButton>
            <NewButton Text="Nowy użytkownik"></NewButton>
            <DeleteButton Text="Usuń">
                <Styles>
                </Styles>
            </DeleteButton>
            <CancelButton Text="Anuluj">
                <Styles>
                    <Style CssClass="butn1">
                    </Style>
                </Styles>
            </CancelButton>
            <UpdateButton Text="Zapisz">
                <Styles>
                    <Style CssClass="butn1">
                    </Style>
                </Styles>
            </UpdateButton>
        </SettingsCommandButton>
        <Settings ShowFilterRow="True" />
        <Templates>
            <EditForm>
                <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                    runat="server"></dx:ASPxGridViewTemplateReplacement>
                 <div style="text-align: right; padding: 2px">
                      <table style="width:100%;">
        <tr>
            <td rowspan="2"><uc3:ZarzadzanieFormularzami ID="ZarzadzanieFormularzami1" runat="server" /></td>
            <td style="height: 30px; top: auto;display:flex;"><a  href="javascript: openPopup('passwordPopup.aspx')" class="butn1">Zmień hasło</a>
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement></td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
                   
                   
                </div>
             

              
            </EditForm>
        </Templates>
        <SettingsBehavior ConfirmDelete="True" />
        <EditFormLayoutProperties ColCount="5">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="imie">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="nazwisko">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="login">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="login_domenowy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="admin">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="true" ShowEditButton="True" VisibleIndex="0" ShowCancelButton="True" ShowNewButton="False" ShowUpdateButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ident" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="2" Caption="Imie">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="3" Caption="Nazwisko">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login" VisibleIndex="4" Caption="Login">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" ErrorText="Pole jest wymagane!!!">
                        <RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="password" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login_domenowy" VisibleIndex="7" Name="login_domenowy" Caption="Login domenowy">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="admin" VisibleIndex="8" Caption="Administrator">
            </dx:GridViewDataCheckColumn>
            
        </Columns>
        <Styles>
            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <div style="max-height: 1px; height: 1px; width: 1px;">
    </div>
   
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM uzytkownik WHERE (ident = @ident);
DELETE FROM uprawnienia
WHERE (id_uzytkownika = @ident)
"
        InsertCommand="SELECT imie, nazwisko, login, password, login_domenowy, admin FROM uzytkownik" SelectCommand="SELECT DISTINCT ident, imie, nazwisko, login, password, login_domenowy, admin FROM uzytkownik ORDER BY nazwisko" UpdateCommand="UPDATE uzytkownik SET imie = @imie, nazwisko = @nazwisko, login_domenowy = @login_domenowy, login = @login, admin = @admin WHERE (ident = @ident)">
        <DeleteParameters>
            <asp:Parameter Name="ident" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="imie" />
            <asp:Parameter Name="nazwisko" />
            <asp:Parameter Name="login_domenowy" />
            <asp:Parameter Name="login" />
            <asp:Parameter Name="admin" />
            <asp:Parameter Name="ident" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <br />

    <br />
    <br />

    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>