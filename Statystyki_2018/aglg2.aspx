<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aglg2.aspx.cs" Inherits="Statystyki_2018.aglg2" %>

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
    </style>
    <script src="Scripts/rls.js"></script>

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
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez"> Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                   <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />

                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;" class="content landscape">
        <div class="center">
            <asp:Label ID="infoSad" runat="server"></asp:Label>
        </div>
        <br />
        <div >
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Wydajność sędziów "></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela1" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label_gwTabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>
        <br />
        <div class="page-break">
            &nbsp;<asp:Label ID="Label7" runat="server" Text="Wydajność sędziów "></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli_gwTabela2" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label31" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label32" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela2111" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela2112" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela2113" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela2114" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela2115" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela2116" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela2117" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela2118" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela2119" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela2120" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela2121" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela2122" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label6" runat="server" Text="Efektywny czas pracy"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela 3" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli_gwTabela3" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label31" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label32" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela2111" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela2112" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela2113" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela2114" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela2115" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela2116" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label49" runat="server" Text="Efektywny czas pracy"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel4" runat="server" Text="tabela 4  \/\/\/" Visible="True"></asp:Label>
            &nbsp;<br />

            <asp:GridView ID="gwTabela4" runat="server" OnRowCreated="naglowekTabeli_gwTabela4" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli_gwTabela4" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label33" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label34" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela2123" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela2124" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela2125" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela2126" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela2127" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela2128" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                 
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label3" runat="server">Ilość spraw GC,w których postępowanie toczy się powyżej 2</asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 5  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela5" runat="server" OnRowCreated="naglowekTabeli_gwTabela5" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli_gwTabela5" ShowFooter="True" OnSelectedIndexChanged="gwTabela5_SelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela2104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela2106" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela2106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela2107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela2108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela2109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>
            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label9" runat="server">Ilość spraw Ga,w których postępowanie toczy się powyżej 2 lat</asp:Label>
            &nbsp;<asp:Label ID="infoLabel6" runat="server" Text="tabela 6  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela6" runat="server" OnRowCreated="naglowekTabeli_gwTabela6" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela6" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label23" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label24" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela6101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela6102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela6103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela6104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela6105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela6106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela6107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela6108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela6109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80 center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label13" runat="server">Ilość spraw Ga, w których postępowanie toczy się powyżej 3 miesięcy od daty wpływu akt do Sądu II instancji</asp:Label>
            &nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela7" runat="server" OnRowCreated="naglowekTabeli_gwTabela7" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela7" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label25" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label26" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela7101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela7102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela7103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela7104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela7105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela7106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela7107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                  
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label15" runat="server">Stan referatów  - I instancja</asp:Label>
            &nbsp;<asp:Label ID="infoLabel8" runat="server" Text="tabela 8  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela8" runat="server" OnRowCreated="naglowekTabeli_gwTabela8" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela8" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label35" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label36" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela8101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela8102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela8103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela8104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela8105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                   
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label17" runat="server">Stan referatów  - II instancja</asp:Label>
            &nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:GridView ID="gwTabela9" runat="server" AutoGenerateColumns="False" OnRowCreated="naglowekTabeli_gwTabela9" OnRowDataBound="stopkaTabeli_gwTabela9" ShowFooter="True" ShowHeader="False" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label50" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label51" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela13115" runat="server" CssClass="normal" Text='<%# Eval("d_01")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela13116" runat="server" CssClass="normal" Text='<%# Eval("d_02")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela13117" runat="server" CssClass="normal" Text='<%# Eval("d_03")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela13118" runat="server" CssClass="normal" Text='<%# Eval("d_04")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela13119" runat="server" CssClass="normal" Text='<%# Eval("d_05")%>'></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label19" runat="server">Wskaźnik pozostałości</asp:Label>
            &nbsp;<asp:Label ID="infoLabel10" runat="server" Text="tabela 10  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela10" runat="server" OnRowCreated="naglowekTabeli_gwTabela10" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela10" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label38" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela10101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela10102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela10103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela10104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela10105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela10106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela10107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela10105" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
          

                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label21" runat="server">Sprawy zawieszone I instancja</asp:Label>
            <asp:Label ID="infoLabel11" runat="server" Text="tabela 11  \/\/\/" Visible="True"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll wciecie col_200">&nbsp;</td>
                    <td class="borderAll center col_80">Liczba spraw</td>
                    <td class="borderAll center">Terminy czynności nadzorczych </td>
                </tr>
       <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w01_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w01_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w01_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w02_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w02_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w02_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w03_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w03_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w03_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w04_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w04_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w04_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w05_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w05_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w05_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w06_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w06_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w06_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w07_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w07_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w07_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w08_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w08_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w08_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w09_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w09_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w09_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!11!1!3')"><asp:TextBox CssClass="normal" ID="tab_11_w10_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll center col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!11!2!3')"><asp:TextBox CssClass="normal center" ID="tab_11_w10_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll wciecie"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!11!3!3')"><asp:TextBox CssClass="normal" ID="tab_11_w10_c03" runat="server" BorderStyle="None" Width="95%"></asp:TextBox></a></td>
   </tr> 
       </table>
            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label39" runat="server">Sprawy zawieszone II instancja</asp:Label>
            &nbsp;<asp:Label ID="infoLabel12" runat="server" Text="tabela 12  \/\/\/" Visible="True"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll wciecie col_200">&nbsp;</td>
                    <td class="borderAll col_80">Liczba spraw</td>
                    <td class="borderAll center">Terminy czynności nadzorczych </td>
                </tr>
               <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w01_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w01_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w01_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w02_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w02_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w02_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w03_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w03_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w03_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w04_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w04_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w04_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w05_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w05_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w05_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w06_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w06_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w06_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!12!1!3')"><asp:TextBox CssClass="normal" ID="tab_12_w07_c01" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></a></td>
  <td class="borderAll col_80"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!12!2!3')"><asp:TextBox CssClass="normal center" ID="tab_12_w07_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
  <td class="borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!12!3!3')"><asp:TextBox CssClass="normal" ID="tab_12_w07_c03" runat="server" Width="95%"></asp:TextBox></a></td>
   </tr> 

            </table>







            </div>
          <div class="page-break">

            <br />
              Uzasadnienia GC I instancja
           <asp:Label ID="infoLabel13" runat="server" Text="tabela 13  \/\/\/" Visible="True"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela13" runat="server" OnRowCreated="naglowekTabeli_gwTabela13" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela13" Width="100%" ShowHeader="False" ShowFooter="True" OnSelectedIndexChanged="gwTabela13_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label46" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela13101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela13102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela13103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela13104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela13105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela13106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela13107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela13108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela13109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela13110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                 
                </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label43" runat="server">Terminowość sporządzania uzasadnień Ga II instancja</asp:Label>
            &nbsp;<asp:Label ID="infoLabel14" runat="server" Text="tabela 14  \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:GridView ID="gwTabela14" runat="server" OnRowCreated="naglowekTabeli_gwTabela14"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela14"    Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label8" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label10"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela14101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela14102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela14103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela14104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela14105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela14106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela14107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela14108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela14109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>

               <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela14110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
        </Columns>
                <FooterStyle CssClass="doubleTopBorder gray" />
    </asp:GridView>

            &nbsp;<br />
        </div>

           <div class="page-break">

            <br />
               Sprawność postępowania międzyinstancyjnego <asp:Label ID="Label12" runat="server" Text="tabela 15  \/\/\/" Visible="True"></asp:Label>
            <br />

               <table style="width:100%;">
                   <tr>
                       <td class="borderAll center" colspan="7">Postępowanie międzyinstancyjne </td>
                   </tr>
                   <tr>
                       <td class="borderAll center" colspan="7">Ilość spraw przedstawionych II instancji (od daty orzeczenia)</td>
                   </tr>
                   <tr>
                       <td class="borderAll center borderAll center col_130" rowspan="2">ogółem</td>
                       <td class="borderAll center" colspan="2">do 3 miesięcy</td>
                       <td class="borderAll center" colspan="2">od 3 do 5 miesięcy</td>
                       <td class="borderAll center" colspan="2">powyżej 5 miesięcy</td>
                   </tr>
                   <tr>
                       <td class="borderAll center">ogółem</td>
                       <td class="borderAll center">%</td>
                       <td class="borderAll center">ogółem</td>
                       <td class="borderAll center">%</td>
                       <td class="borderAll center">ogółem</td>
                       <td class="borderAll center">%</td>
                   </tr>
                   <tr>
                     
                       <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                     <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                       <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                     <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                      <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_130"> <a href="javascript:openPopup('popup.aspx?sesja=1!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                   </tr>
               </table>
               <br />

            <br />
        </div>
                <div class="page-break">
            &nbsp;<asp:Label ID="Label14" runat="server">Odroczone sprawy GC</asp:Label>
            &nbsp;<asp:Label ID="Label16" runat="server" Text="tabela 16  \/\/\/" Visible="True"></asp:Label>
            <br />
                    <asp:GridView ID="gwTabela16" runat="server" OnRowCreated="naglowekTabeli_gwTabela16"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela16"   Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label18" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label20"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela16101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela16102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela16103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela16104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela16105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela16106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela16107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela16108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela16109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela16110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela16111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela16112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela16113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_gwTabela16114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
            
        </Columns>
                        <FooterStyle CssClass="doubleTopBorder gray" />
    </asp:GridView>
                    <br />
        </div>
         <div class="page-break">
            &nbsp;<asp:Label ID="Label40" runat="server">Odroczone sprawy Ga</asp:Label>
            &nbsp;<asp:Label ID="infoLabel17" runat="server" Text="tabela 17  \/\/\/" Visible="True"></asp:Label>
                     <asp:GridView ID="gwTabela17" runat="server" OnRowCreated="naglowekTabeli_gwTabela17"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela17"   Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label18" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label20"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela17101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela17102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela17103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela17104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela17105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela17106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela17107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela17108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela17109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela17110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela17111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela17112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela17113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
               <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_gwTabela17114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80"/>
                </asp:TemplateField>
            
        </Columns>
                         <FooterStyle CssClass="doubleTopBorder gray" />
    </asp:GridView>
            <br />
             </div>
        <div class="page-break">

            <br />
            Terminowość przyznawania wynagrodzeń i wypłaty biegłym i tłumaczom <asp:Label ID="Label22" runat="server" Text="tabela 18  \/\/\/" Visible="True"></asp:Label>
            <br />

              
 <table style="width: 100%; "> 
   <tr> 
  <td class="borderAll center col_80" rowspan="3"> 
      Instancja</td > 
  <td class="borderAll center col_80" rowspan="3"> 
      Złożone wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi)</td > 
  <td class="borderAll center" colspan="5"> 
      Rozpoznane wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi), licząc od daty wpływu wniosku/rachunku</td > 
  <td class="borderAll center" colspan="5"> 
      Wnioski przekazane do oddziału finansowego, licząc od daty uprawomocnienia orzeczenia</td > 
   </tr> 
   <tr> 
  <td class="borderAll center col_80" rowspan="2"> 
      Razem</td > 
  <td class="borderAll center" colspan="4"> 
      w tym w terminie</td > 
  <td class="borderAll center" colspan="5"> 
      w tym w terminie</td > 
   </tr> 
   <tr> 
  <td class="borderAll center col_80"> 
      Razem</td > 
  <td class="borderAll center col_80"> 
      do 14 dni</td > 
  <td class="borderAll center col_80"> 
      pow. 14 do 30 dni</td > 
  <td class="borderAll center col_80"> 
      powyżej 30 dni</td > 
  <td class="borderAll center col_80"> 
      % powyżej 30 dni do razem</td > 
  <td class="borderAll center col_80"> 
      do 14 dni</td > 
  <td class="borderAll center col_80"> 
      pow. 14 do 30 dni</td > 
  <td class="borderAll center col_80"> 
      powyżej 30 dni</td > 
  <td class="borderAll center col_80"> 
      % powyżej 30 dni do razem</td > 
   </tr> 
   <tr> 
  <td class="borderAll center"> 
      I</td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!1!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!2!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!3!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!4!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!5!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!6!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!7!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!8!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!9!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!10!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!18!11!3')"><asp:Label CssClass="normal" ID="tab_18_w01_c11" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll center"> 
      II</td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!1!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!2!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!3!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!4!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!5!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!6!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!7!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!8!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!9!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!10!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!18!11!3')"><asp:Label CssClass="normal" ID="tab_18_w02_c11" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll center gray"> 
      Razem</td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!1!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!2!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!3!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!4!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!5!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!6!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!7!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!8!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!9!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!10!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!18!11!3')"><asp:Label CssClass="normal" ID="tab_18_w03_c11" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
 </table> 


               <br />
             
        

        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                     <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>
    </div>
</div>
</asp:Content>