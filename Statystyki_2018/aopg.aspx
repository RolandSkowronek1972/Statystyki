<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aopg.aspx.cs" Inherits="Statystyki_2018.aopg" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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

              @media print {
                  @page {
                      size: 29cm 21.7cm;
                      margin: 0mm 0mm 0mm 0mm;
                  }

                  div {
                      transform: translate(0, 0);
                      -webkit-transform: translate(0, 0 ); /* Saf3.1+, Chrome */
                      -moz-transform: translate(0, 0); /* FF3.5+ */
                  }
              }
          </style>
      <script src="Scripts/rls.js"></script>

     <div id="menu" class="manu_back noprint" style="height:40px;">
         <asp:ScriptManager ID="ScriptManager1" runat="server">     
              </asp:ScriptManager>   

   <table>
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
            <td style="width:auto;padding-left:5px;">
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                  <td style="width:auto;padding-left:5px;">
                      &nbsp;</td>
            </td>

            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    </table>
      </div>
       <div style=" margin: 0 auto 0 auto; position:relative;top:30px;">
             <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
            <asp:Label ID="LabelNazwaSadu" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div>

           <br />
               <div>
&nbsp;<asp:Label ID="Label1" runat="server" Text="Ruch spraw w referatach sędziów"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
           <br />
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" OnTick="TimerTick" Interval="2000">
                    </asp:Timer>
                   <br />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnCustomSummaryCalculate="Suma" Theme="MetropolisBlue" EnableCallbackAnimation="True" OnSummaryDisplayText="ASPxGridView1_SummaryDisplayText">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>
                      <asp:Image ID="imgLoader" CssClass="center" style="z-index:99999; position:absolute; top:250px; left:600px; margin-right:auto;" runat="server" ImageUrl="~/img/ajax-loader.gif" />
                </ContentTemplate>
            </asp:UpdatePanel>
                    <asp:Panel ID="Panel1" runat="server" Width="100%">
                   </asp:Panel>
               </div>
           <br />

           <div class="page-break">
&nbsp;<asp:Label ID="Label7" runat="server" Text="Wyznaczenia i załatwienia w referatach sędziów"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="False"></asp:Label>
               <br />

    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" Theme="MetropolisBlue" OnSummaryDisplayText="ASPxGridView2_SummaryDisplayText">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>
           <br />

                   <br />
               </div>

             <div id="debag">
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
           </div>
</asp:Content>