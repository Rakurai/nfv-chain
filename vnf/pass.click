in_dev :: FromDevice(eth1)
out_dev :: ToDevice(eth1)

VNF_IN::PushNull;

VNF_OUT:: {
  input[0] -> StoreEtherAddress(00:8c:fa:5a:fe:b6, dst) -> [0]output;
};

in_dev -> VNF_IN
VNF_OUT[0] => StoreEtherAddress(ca:45:20:4b:b1:f2, src) -> SimpleQueue -> out_dev

VNF_IN -> VNF_OUT
