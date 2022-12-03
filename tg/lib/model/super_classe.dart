class SuperProdutos {
  int? idPedidoCliente;
  String? cpfCliente;
  String? nomeDoCliente;
  int? statusPedidoCliente;
  String? dataInsercaoPedido;
  int? idProduto;
  String? nomeProduto;
  int? quantidadePedidaProduto;
  int? statusProdutos;
  String? tempoPreparo;
  int? prioridade;

  SuperProdutos({
    this.cpfCliente,
    this.dataInsercaoPedido,
    this.idPedidoCliente,
    this.idProduto,
    this.nomeDoCliente,
    this.nomeProduto,
    this.prioridade,
    this.quantidadePedidaProduto,
    this.statusPedidoCliente,
    this.statusProdutos,
    this.tempoPreparo,
  });
}
