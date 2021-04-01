<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="okt2.aspx.cs" Inherits="Statystyki_2018.okt2" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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

            .horizont {
                transform: translate(-10mm, 0) scale(0.75);
                -webkit-transform: translate(-10mm, 0) scale(0.75);
                -moz-transform: translate(-10mm, 0) scale(0.75);
            }
        }
    </style>

    <div id="menu" class="manu_back noprint" style="height: 40px;">

        <table>
            <tr>
                <td style="width: auto; padding-left: 5px;">
                    <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                         <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>
          
              

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;" class="content landscape">
        <div style="text-align: center">
            <asp:Label ID="LabelNazwaSadu" runat="server" Style="text-align: center; font-weight: 700" Text="Label"></asp:Label>
        </div>
        <br />
        <br />
       
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
                <br />
                <div class="horizont">
                    &nbsp;<asp:Label ID="Label7" runat="server" Text="Terminowość sporządzania uzasadnień"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 1 \/\/" Visible="False"></asp:Label>
                    <br />

                    <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="99%" ShowHeader="False" ShowFooter="True">
                        <Columns>

                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                <ItemTemplate>
                                    <asp:Label ID="Label49" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                    <asp:Label ID="Label50" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_nazwisko" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                        <asp:Label ID="Label_gwTabela13115" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                        <asp:Label ID="Label_gwTabela13116" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                        <asp:Label ID="Label_gwTabela13117" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                        <asp:Label ID="Label_gwTabela13118" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                        <asp:Label ID="Label_gwTabela13119" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                        <asp:Label ID="Label_gwTabela13120" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                        <asp:Label ID="Label_gwTabela13121" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                        <asp:Label ID="Label_gwTabela13122" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                        <asp:Label ID="Label_gwTabela13123" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                        <asp:Label ID="Label_gwTabela13124" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                        <asp:Label ID="Label_gwTabela13125" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                        <asp:Label ID="Label_gwTabela13126" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                        <asp:Label ID="Label_gwTabela13127" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                        <asp:Label ID="Label_gwTabela13134" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                        <asp:Label ID="Label_gwTabela13135" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                        <asp:Label ID="Label_gwTabela13136" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                        <asp:Label ID="Label_gwTabela13137" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                                        <asp:Label ID="Label_gwTabela13138" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                                        <asp:Label ID="Label_gwTabela13129" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')">
                                        <asp:Label ID="Label_gwTabela13139" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')">
                                        <asp:Label ID="Label_gwTabela13131" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle CssClass="gray" />
                    </asp:GridView>

                    <br />
                </div>
              
                   

                                <div id="debag">
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