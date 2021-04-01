<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oopu.aspx.cs" Inherits="Statystyki_2018.oopu" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="UserControlls/PopupLinkButtom.ascx" TagName="PopupLinkButtom" TagPrefix="uc1" %>

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

    <div id="menu" style="background-color: #f7f7f7; z-index: 9999" class="noprint">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
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
                        <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                    </td>
                    <td style="width: auto; padding-left: 5px;">
                        &nbsp;</td>
                    <td style="width: auto; padding-left: 5px;">

                        &nbsp;</td>
                    <td style="width: auto; padding-left: 5px;">
                        <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div style="margin: 0px 30px 0px 30px; position: relative; top: 60px; width: 100%;">
        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu"></asp:Label>
            </div>
        </div>
        <div id="zalatwienia" style="clear: both;">

            <asp:Label ID="Label19" runat="server"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="grvMergeHeader_RowCreated" ShowHeader="False" Width="100%" CssClass="GridView1" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                        SortExpression="funkcja">
                        <ItemStyle CssClass="t2_funkcja" />
                    </asp:BoundField>
                    <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                        SortExpression="stanowisko">
                        <ItemStyle CssClass="tx_stanowisko" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>

                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!1!5"%>')">
                                <asp:Label ID="Label1001" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!2!5"%>')">
                                <asp:Label ID="Label1002" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!3!5"%>')">
                                <asp:Label ID="Label1003" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!4!5"%>')">
                                <asp:Label ID="Label1004" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!5!5"%>')">
                                <asp:Label ID="Label1005" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!6!5"%>')">
                                <asp:Label ID="Label1006" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!7!5"%>')">
                                <asp:Label ID="Label1007" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_08">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!8!5"%>')">
                                <asp:Label ID="Label1008" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!9!5"%>')">
                                <asp:Label ID="Label1009" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#CCCCCC"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_10" SortExpression="d_10">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!10!5"%>')">
                                <asp:Label ID="Label1010" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#CCCCCC" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_11" SortExpression="d_11">

                        <ItemTemplate>

                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!11!5"%>')">
                                <asp:Label ID="Label1011" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_12">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!12!5"%>')">
                                <asp:Label ID="Label1012" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_13">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!13!5"%>')">
                                <asp:Label ID="Label1013" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_15" SortExpression="d_15">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!14!5"%>')">
                                <asp:Label ID="Label1014" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_15">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!15!5"%>')">
                                <asp:Label ID="Label1015" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_16" SortExpression="d_16">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!16!5"%>')">
                                <asp:Label ID="Label1016" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_17" SortExpression="d_17">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!17!5"%>')">
                                <asp:Label ID="Label1017" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_18" SortExpression="d_18">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!18!5"%>')">
                                <asp:Label ID="Label1018" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_19" SortExpression="d_19">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!19!5"%>')">
                                <asp:Label ID="Label1019" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_20" SortExpression="d_20">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!20!5"%>')">
                                <asp:Label ID="Label1020" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_21" SortExpression="d_21">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!21!5"%>')">
                                <asp:Label ID="Label1021" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_22">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!22!5"%>')">
                                <asp:Label ID="Label1022" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_23">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!23!5"%>')">
                                <asp:Label ID="Label1023" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_24" SortExpression="d_24">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!24!5"%>')">
                                <asp:Label ID="Label1024" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_25">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!25!5"%>')">
                                <asp:Label ID="Label1025" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#CCCCCC" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_26" SortExpression="d_26">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!26!5"%>')">
                                <asp:Label ID="Label1026" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  BackColor="#CCCCCC" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_27" SortExpression="d_27">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!27!5"%>')">
                                <asp:Label ID="Label1027" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_28" SortExpression="d_28">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!28!5"%>')">
                                <asp:Label ID="Label1028" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_29" SortExpression="d_29">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!29!5"%>')">
                                <asp:Label ID="Label1029" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_30" SortExpression="d_30">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!30!5"%>')">
                                <asp:Label ID="Label1030" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_31" SortExpression="d_31">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!31!5"%>')">
                                <asp:Label ID="Label1031" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_32">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!32!5"%>')">
                                <asp:Label ID="Label1032" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_33">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!33!5"%>')">
                                <asp:Label ID="Label1033" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!34!5"%>')">
                                <asp:Label ID="Label1034" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!35!5"%>')">
                                <asp:Label ID="Label1035" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_36" SortExpression="d_36">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!36!5"%>')">
                                <asp:Label ID="Label1036" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_37" SortExpression="d_37">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!37!5"%>')">
                                <asp:Label ID="Label1037" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_38" SortExpression="d_38">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!38!5"%>')">
                                <asp:Label ID="Label1038" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_39" SortExpression="d_39">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!39!5"%>')">
                                <asp:Label ID="Label1039" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_30" SortExpression="d_30">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!40!5"%>')">
                                <asp:Label ID="Label1040" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_31" SortExpression="d_31">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!41!5"%>')">
                                <asp:Label ID="Label1041" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#ccccccc"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_32">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!42!5"%>')">
                                <asp:Label ID="Label1042" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_33">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!43!5"%>')">
                                <asp:Label ID="Label1043" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!44!5"%>')">
                                <asp:Label ID="Label1044" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!45!5"%>')">
                                <asp:Label ID="Label1045" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_36" SortExpression="d_36">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!46!5"%>')">
                                <asp:Label ID="Label1046" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_37" SortExpression="d_37">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!47!5"%>')">
                                <asp:Label ID="Label1047" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_38" SortExpression="d_38">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!48!5"%>')">
                                <asp:Label ID="Label1048" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_39" SortExpression="d_39">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!49!5"%>')">
                                <asp:Label ID="Label1049" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#ccccccc" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!50!5"%>')">
                                <asp:Label ID="Label1050" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_51" SortExpression="d_51">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!51!5"%>')">
                                <asp:Label ID="Label1051" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!52!5"%>')">
                                <asp:Label ID="Label1052" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!53!5"%>')">
                                <asp:Label ID="Label1053" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_54" SortExpression="d_54">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!54!5"%>')">
                                <asp:Label ID="Label1054" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!55!5"%>')">
                                <asp:Label ID="Label1055" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_56" SortExpression="d_56">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!56!5"%>')">
                                <asp:Label ID="Label1056" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_57" SortExpression="d_57">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!57!5"%>')">
                                <asp:Label ID="Label1057" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_58" SortExpression="d_58">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!58!5"%>')">
                                <asp:Label ID="Label1058" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_59" SortExpression="d_59">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!59!5"%>')">
                                <asp:Label ID="Label1059" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!60!5"%>')">
                                <asp:Label ID="Label1060" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_51" SortExpression="d_51">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!61!5"%>')">
                                <asp:Label ID="Label1061" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!62!5"%>')">
                                <asp:Label ID="Label1062" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!63!5"%>')">
                                <asp:Label ID="Label1063" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_54" SortExpression="d_54">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!64!5"%>')">
                                <asp:Label ID="Label1064" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!65!5"%>')">
                                <asp:Label ID="Label1065" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_56" SortExpression="d_56">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!66!5"%>')">
                                <asp:Label ID="Label1066" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_57" SortExpression="d_57">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!67!5"%>')">
                                <asp:Label ID="Label1067" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_58" SortExpression="d_58">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!68!5"%>')">
                                <asp:Label ID="Label1068" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_59" SortExpression="d_59">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!69!5"%>')">
                                <asp:Label ID="Label1069" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!70!5"%>')">
                                <asp:Label ID="Label1070" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_51" SortExpression="d_51">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!71!5"%>')">
                                <asp:Label ID="Label1071" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!72!5"%>')">
                                <asp:Label ID="Label1072" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!73!5"%>')">
                                <asp:Label ID="Label1073" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_54" SortExpression="d_54">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!74!5"%>')">
                                <asp:Label ID="Label1074" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!75!5"%>')">
                                <asp:Label ID="Label1075" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_56" SortExpression="d_56">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!76!5"%>')">
                                <asp:Label ID="Label1076" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_57" SortExpression="d_57">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!77!5"%>')">
                                <asp:Label ID="Label1077" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_58" SortExpression="d_58">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!78!5"%>')">
                                <asp:Label ID="Label1078" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_59" SortExpression="d_59">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!79!5"%>')">
                                <asp:Label ID="Label1079" runat="server" Text='<%# Eval("d_79")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!80!5"%>')">
                                <asp:Label ID="Label1080" runat="server" Text='<%# Eval("d_80")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1"  />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_51" SortExpression="d_51">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!81!5"%>')">
                                <asp:Label ID="Label1081" runat="server" Text='<%# Eval("d_81")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!82!5"%>')">
                                <asp:Label ID="Label1082" runat="server" Text='<%# Eval("d_82")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!83!5"%>')">
                                <asp:Label ID="Label1083" runat="server" Text='<%# Eval("d_83")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_54" SortExpression="d_54">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!84!5"%>')">
                                <asp:Label ID="Label1084" runat="server" Text='<%# Eval("d_84")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!85!5"%>')">
                                <asp:Label ID="Label1085" runat="server" Text='<%# Eval("d_85")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_56" SortExpression="d_56">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!86!5"%>')">
                                <asp:Label ID="Label1086" runat="server" Text='<%# Eval("d_86")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_57" SortExpression="d_57">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!87!5"%>')">
                                <asp:Label ID="Label1087" runat="server" Text='<%# Eval("d_87")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_58" SortExpression="d_58">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!88!5"%>')">
                                <asp:Label ID="Label1088" runat="server" Text='<%# Eval("d_88")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_59" SortExpression="d_59">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!89!5"%>')">
                                <asp:Label ID="Label1089" runat="server" Text='<%# Eval("d_89")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_90" SortExpression="d_90">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!90!5"%>')">
                                <asp:Label ID="Label1090" runat="server" Text='<%# Eval("d_90")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_91" SortExpression="d_91">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!91!5"%>')">
                                <asp:Label ID="Label1091" runat="server" Text='<%# Eval("d_91")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#cccccc" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_92" SortExpression="d_92">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!92!5"%>')">
                                <asp:Label ID="Label1092" runat="server" Text='<%# Eval("d_92")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_93" SortExpression="d_93">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!93!5"%>')">
                                <asp:Label ID="Label1093" runat="server" Text='<%# Eval("d_93")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_94" SortExpression="d_94">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!94!5"%>')">
                                <asp:Label ID="Label1094" runat="server" Text='<%# Eval("d_94")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_95" SortExpression="d_95">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!95!5"%>')">
                                <asp:Label ID="Label1095" runat="server" Text='<%# Eval("d_95")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_96" SortExpression="d_96">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!96!5"%>')">
                                <asp:Label ID="Label1096" runat="server" Text='<%# Eval("d_96")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_97" SortExpression="d_97">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!97!5"%>')">
                                <asp:Label ID="Label1097" runat="server" Text='<%# Eval("d_97")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_98" SortExpression="d_98">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!98!5"%>')">
                                <asp:Label ID="Label1098" runat="server" Text='<%# Eval("d_98")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_99" SortExpression="d_99">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!99!5"%>')">
                                <asp:Label ID="Label1093" runat="server" Text='<%# Eval("d_99")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" BackColor="#dddddd" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_100" SortExpression="d_100">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!100!5"%>')">
                                <asp:Label ID="Label1100" runat="server" Text='<%# Eval("d_100")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_101" SortExpression="d_101">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!101!5"%>')">
                                <asp:Label ID="Label1101" runat="server" Text='<%# Eval("d_101")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_102" SortExpression="d_102">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!102!5"%>')">
                                <asp:Label ID="Label1102" runat="server" Text='<%# Eval("d_102")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_103" SortExpression="d_103">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!103!5"%>')">
                                <asp:Label ID="Label1103" runat="server" Text='<%# Eval("d_103")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_104" SortExpression="d_104">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!104!5"%>')">
                                <asp:Label ID="Label1104" runat="server" Text='<%# Eval("d_104")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="d_104" SortExpression="d_104">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!5!105!5"%>')">
                                <asp:Label ID="Label1105" runat="server" Text='<%# Eval("d_105")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="tx_d1" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>

        <br />
        Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
        &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
        &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
        <asp:Panel ID="Panel5" runat="server">
            <asp:Label ID="Label31" runat="server"></asp:Label>
        </asp:Panel>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>

        <br />
    </div>

    <asp:Panel ID="Panel4" runat="server" Visible="False">
    </asp:Panel>
</asp:Content>