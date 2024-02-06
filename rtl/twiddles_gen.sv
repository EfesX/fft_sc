import fft_pkg::twiddle_t;
import fft_pkg::TWIDDLE_POWER;

module twiddles_gen #(parameter int unsigned FFT_SIZE = 16) ( 
    input  logic                                                  clk     , 
    input  logic     [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] indexes , 
    output twiddle_t [$clog2(FFT_SIZE)-2:0]                       twiddles  
);

    localparam int unsigned TOTAL_TWIDDLES = FFT_SIZE/2;
    twiddle_t [TOTAL_TWIDDLES-1:0] twiddles_storage;

    initial begin
        twiddles_storage[0].cos = 1.0 * ((2 ** 8) - 1);
        twiddles_storage[0].sin = -0.0 * ((2 ** 8) - 1);

        twiddles_storage[1].cos = 0.9996988172876875 * ((2 ** 8) - 1);
        twiddles_storage[1].sin = -0.02454128589945604 * ((2 ** 8) - 1);

        twiddles_storage[2].cos = 0.9987954505728023 * ((2 ** 8) - 1);
        twiddles_storage[2].sin = -0.049067788976810404 * ((2 ** 8) - 1);

        twiddles_storage[3].cos = 0.9972904440122193 * ((2 ** 8) - 1);
        twiddles_storage[3].sin = -0.07356473531462235 * ((2 ** 8) - 1);

        twiddles_storage[4].cos = 0.9951847041698544 * ((2 ** 8) - 1);
        twiddles_storage[4].sin = -0.09801736879940907 * ((2 ** 8) - 1);

        twiddles_storage[5].cos = 0.9924794994705819 * ((2 ** 8) - 1);
        twiddles_storage[5].sin = -0.12241096001021831 * ((2 ** 8) - 1);

        twiddles_storage[6].cos = 0.9891764594361792 * ((2 ** 8) - 1);
        twiddles_storage[6].sin = -0.1467308150911222 * ((2 ** 8) - 1);

        twiddles_storage[7].cos = 0.985277573703759 * ((2 ** 8) - 1);
        twiddles_storage[7].sin = -0.1709622846022882 * ((2 ** 8) - 1);

        twiddles_storage[8].cos = 0.9807851908272812 * ((2 ** 8) - 1);
        twiddles_storage[8].sin = -0.19509077234429487 * ((2 ** 8) - 1);

        twiddles_storage[9].cos = 0.975702016862865 * ((2 ** 8) - 1);
        twiddles_storage[9].sin = -0.21910174415037792 * ((2 ** 8) - 1);

        twiddles_storage[10].cos = 0.9700311137387535 * ((2 ** 8) - 1);
        twiddles_storage[10].sin = -0.24298073664130976 * ((2 ** 8) - 1);

        twiddles_storage[11].cos = 0.9637758974109153 * ((2 ** 8) - 1);
        twiddles_storage[11].sin = -0.26671336593763895 * ((2 ** 8) - 1);

        twiddles_storage[12].cos = 0.9569401358053898 * ((2 ** 8) - 1);
        twiddles_storage[12].sin = -0.2902853363240419 * ((2 ** 8) - 1);

        twiddles_storage[13].cos = 0.9495279465486192 * ((2 ** 8) - 1);
        twiddles_storage[13].sin = -0.3136824488605677 * ((2 ** 8) - 1);

        twiddles_storage[14].cos = 0.9415437944871324 * ((2 ** 8) - 1);
        twiddles_storage[14].sin = -0.33689060993558806 * ((2 ** 8) - 1);

        twiddles_storage[15].cos = 0.9329924889980764 * ((2 ** 8) - 1);
        twiddles_storage[15].sin = -0.3598958397553025 * ((2 ** 8) - 1);

        twiddles_storage[16].cos = 0.923879181092213 * ((2 ** 8) - 1);
        twiddles_storage[16].sin = -0.38268428076468186 * ((2 ** 8) - 1);

        twiddles_storage[17].cos = 0.9142093603111289 * ((2 ** 8) - 1);
        twiddles_storage[17].sin = -0.40524220599478106 * ((2 ** 8) - 1);

        twiddles_storage[18].cos = 0.9039888514205247 * ((2 ** 8) - 1);
        twiddles_storage[18].sin = -0.4275560273313903 * ((2 ** 8) - 1);

        twiddles_storage[19].cos = 0.8932238109015783 * ((2 ** 8) - 1);
        twiddles_storage[19].sin = -0.449612303700045 * ((2 ** 8) - 1);

        twiddles_storage[20].cos = 0.8819207232424929 * ((2 ** 8) - 1);
        twiddles_storage[20].sin = -0.4713977491624649 * ((2 ** 8) - 1);

        twiddles_storage[21].cos = 0.870086397032466 * ((2 ** 8) - 1);
        twiddles_storage[21].sin = -0.49289924091954324 * ((2 ** 8) - 1);

        twiddles_storage[22].cos = 0.8577279608604302 * ((2 ** 8) - 1);
        twiddles_storage[22].sin = -0.5141038272160676 * ((2 ** 8) - 1);

        twiddles_storage[23].cos = 0.8448528590210379 * ((2 ** 8) - 1);
        twiddles_storage[23].sin = -0.5349987351424097 * ((2 ** 8) - 1);

        twiddles_storage[24].cos = 0.8314688470304757 * ((2 ** 8) - 1);
        twiddles_storage[24].sin = -0.5555713783284838 * ((2 ** 8) - 1);

        twiddles_storage[25].cos = 0.8175839869548096 * ((2 ** 8) - 1);
        twiddles_storage[25].sin = -0.5758093645253416 * ((2 ** 8) - 1);

        twiddles_storage[26].cos = 0.8032066425536747 * ((2 ** 8) - 1);
        twiddles_storage[26].sin = -0.5957005030698341 * ((2 ** 8) - 1);

        twiddles_storage[27].cos = 0.7883454742422363 * ((2 ** 8) - 1);
        twiddles_storage[27].sin = -0.6152328122278455 * ((2 ** 8) - 1);

        twiddles_storage[28].cos = 0.7730094338744549 * ((2 ** 8) - 1);
        twiddles_storage[28].sin = -0.634394526411676 * ((2 ** 8) - 1);

        twiddles_storage[29].cos = 0.7572077593507985 * ((2 ** 8) - 1);
        twiddles_storage[29].sin = -0.6531741032672248 * ((2 ** 8) - 1);

        twiddles_storage[30].cos = 0.7409499690536513 * ((2 ** 8) - 1);
        twiddles_storage[30].sin = -0.671560230626705 * ((2 ** 8) - 1);

        twiddles_storage[31].cos = 0.7242458561137692 * ((2 ** 8) - 1);
        twiddles_storage[31].sin = -0.6895418333227024 * ((2 ** 8) - 1);

        twiddles_storage[32].cos = 0.7071054825112363 * ((2 ** 8) - 1);
        twiddles_storage[32].sin = -0.7071080798594735 * ((2 ** 8) - 1);

        twiddles_storage[33].cos = 0.6895391730144758 * ((2 ** 8) - 1);
        twiddles_storage[33].sin = -0.7242483889374645 * ((2 ** 8) - 1);

        twiddles_storage[34].cos = 0.6715575089609669 * ((2 ** 8) - 1);
        twiddles_storage[34].sin = -0.740952435827119 * ((2 ** 8) - 1);

        twiddles_storage[35].cos = 0.6531713218834124 * ((2 ** 8) - 1);
        twiddles_storage[35].sin = -0.7572101585881397 * ((2 ** 8) - 1);

        twiddles_storage[36].cos = 0.6343916869851989 * ((2 ** 8) - 1);
        twiddles_storage[36].sin = -0.773011764130452 * ((2 ** 8) - 1);

        twiddles_storage[37].cos = 0.6152299164690759 * ((2 ** 8) - 1);
        twiddles_storage[37].sin = -0.7883477341132237 * ((2 ** 8) - 1);

        twiddles_storage[38].cos = 0.5956975527230769 * ((2 ** 8) - 1);
        twiddles_storage[38].sin = -0.803208830678384 * ((2 ** 8) - 1);

        twiddles_storage[39].cos = 0.5758063613677837 * ((2 ** 8) - 1);
        twiddles_storage[39].sin = -0.8175861020151903 * ((2 ** 8) - 1);

        twiddles_storage[40].cos = 0.5555683241691236 * ((2 ** 8) - 1);
        twiddles_storage[40].sin = -0.8314708877524887 * ((2 ** 8) - 1);

        twiddles_storage[41].cos = 0.5349956318209671 * ((2 ** 8) - 1);
        twiddles_storage[41].sin = -0.8448548241754226 * ((2 ** 8) - 1);

        twiddles_storage[42].cos = 0.5141006766018762 * ((2 ** 8) - 1);
        twiddles_storage[42].sin = -0.8577298492634456 * ((2 ** 8) - 1);

        twiddles_storage[43].cos = 0.4928960449104241 * ((2 ** 8) - 1);
        twiddles_storage[43].sin = -0.8700882075466034 * ((2 ** 8) - 1);

        twiddles_storage[44].cos = 0.4713945096835833 * ((2 ** 8) - 1);
        twiddles_storage[44].sin = -0.8819224547771612 * ((2 ** 8) - 1);

        twiddles_storage[45].cos = 0.4496090227027513 * ((2 ** 8) - 1);
        twiddles_storage[45].sin = -0.8932254624137608 * ((2 ** 8) - 1);

        twiddles_storage[46].cos = 0.42755270679204355 * ((2 ** 8) - 1);
        twiddles_storage[46].sin = -0.9039904219154077 * ((2 ** 8) - 1);

        twiddles_storage[47].cos = 0.40523884791355935 * ((2 ** 8) - 1);
        twiddles_storage[47].sin = -0.9142108488427005 * ((2 ** 8) - 1);

        twiddles_storage[48].cos = 0.38268088716437737 * ((2 ** 8) - 1);
        twiddles_storage[48].sin = -0.9238805867638334 * ((2 ** 8) - 1);

        twiddles_storage[49].cos = 0.3598924126801025 * ((2 ** 8) - 1);
        twiddles_storage[49].sin = -0.9329938109630175 * ((2 ** 8) - 1);

        twiddles_storage[50].cos = 0.3368871514498445 * ((2 ** 8) - 1);
        twiddles_storage[50].sin = -0.9415450319490882 * ((2 ** 8) - 1);

        twiddles_storage[51].cos = 0.3136789610475525 * ((2 ** 8) - 1);
        twiddles_storage[51].sin = -0.9495290987621854 * ((2 ** 8) - 1);

        twiddles_storage[52].cos = 0.2902818212846931 * ((2 ** 8) - 1);
        twiddles_storage[52].sin = -0.9569412020765129 * ((2 ** 8) - 1);

        twiddles_storage[53].cos = 0.26670982578929486 * ((2 ** 8) - 1);
        twiddles_storage[53].sin = -0.9637768770973103 * ((2 ** 8) - 1);

        twiddles_storage[54].cos = 0.24297717351643314 * ((2 ** 8) - 1);
        twiddles_storage[54].sin = -0.9700320062502913 * ((2 ** 8) - 1);

        twiddles_storage[55].cos = 0.21909816019527203 * ((2 ** 8) - 1);
        twiddles_storage[55].sin = -0.9757028216619275 * ((2 ** 8) - 1);

        twiddles_storage[56].cos = 0.19508716971781054 * ((2 ** 8) - 1);
        twiddles_storage[56].sin = -0.9807859074290852 * ((2 ** 8) - 1);

        twiddles_storage[57].cos = 0.17095866547452285 * ((2 ** 8) - 1);
        twiddles_storage[57].sin = -0.9852782016766484 * ((2 ** 8) - 1);

        twiddles_storage[58].cos = 0.1467271816421135 * ((2 ** 8) - 1);
        twiddles_storage[58].sin = -0.9891769984018847 * ((2 ** 8) - 1);

        twiddles_storage[59].cos = 0.12240731442863007 * ((2 ** 8) - 1);
        twiddles_storage[59].sin = -0.9924799491044494 * ((2 ** 8) - 1);

        twiddles_storage[60].cos = 0.0980137132812136 * ((2 ** 8) - 1);
        twiddles_storage[60].sin = -0.99518506420104 * ((2 ** 8) - 1);

        twiddles_storage[61].cos = 0.07356107206177764 * ((2 ** 8) - 1);
        twiddles_storage[61].sin = -0.9972907142238525 * ((2 ** 8) - 1);

        twiddles_storage[62].cos = 0.04906412019593309 * ((2 ** 8) - 1);
        twiddles_storage[62].sin = -0.9987956308021171 * ((2 ** 8) - 1);

        twiddles_storage[63].cos = 0.024537613800493095 * ((2 ** 8) - 1);
        twiddles_storage[63].sin = -0.9996989074261199 * ((2 ** 8) - 1);

        twiddles_storage[64].cos = -3.673205103346574e-06 * ((2 ** 8) - 1);
        twiddles_storage[64].sin = -0.9999999999932537 * ((2 ** 8) - 1);

        twiddles_storage[65].cos = -0.024544957998088035 * ((2 ** 8) - 1);
        twiddles_storage[65].sin = -0.9996987271357667 * ((2 ** 8) - 1);

        twiddles_storage[66].cos = -0.04907145775702558 * ((2 ** 8) - 1);
        twiddles_storage[66].sin = -0.9987952703300114 * ((2 ** 8) - 1);

        twiddles_storage[67].cos = -0.07356839856647457 * ((2 ** 8) - 1);
        twiddles_storage[67].sin = -0.9972901737871301 * ((2 ** 8) - 1);

        twiddles_storage[68].cos = -0.09802102431628186 * ((2 ** 8) - 1);
        twiddles_storage[68].sin = -0.9951843441252414 * ((2 ** 8) - 1);

        twiddles_storage[69].cos = -0.1224146055901549 * ((2 ** 8) - 1);
        twiddles_storage[69].sin = -0.9924790498233234 * ((2 ** 8) - 1);

        twiddles_storage[70].cos = -0.14673444853815135 * ((2 ** 8) - 1);
        twiddles_storage[70].sin = -0.9891759204571271 * ((2 ** 8) - 1);

        twiddles_storage[71].cos = -0.17096590372774673 * ((2 ** 8) - 1);
        twiddles_storage[71].sin = -0.9852769457175758 * ((2 ** 8) - 1);

        twiddles_storage[72].cos = -0.195094374968147 * ((2 ** 8) - 1);
        twiddles_storage[72].sin = -0.980784474212244 * ((2 ** 8) - 1);

        twiddles_storage[73].cos = -0.2191053281025274 * ((2 ** 8) - 1);
        twiddles_storage[73].sin = -0.9757012120506379 * ((2 ** 8) - 1);

        twiddles_storage[74].cos = -0.24298429976290792 * ((2 ** 8) - 1);
        twiddles_storage[74].sin = -0.9700302212141276 * ((2 ** 8) - 1);

        twiddles_storage[75].cos = -0.2667169060823845 * ((2 ** 8) - 1);
        twiddles_storage[75].sin = -0.9637749177115166 * ((2 ** 8) - 1);

        twiddles_storage[76].cos = -0.29028885135947397 * ((2 ** 8) - 1);
        twiddles_storage[76].sin = -0.9569390695213553 * ((2 ** 8) - 1);

        twiddles_storage[77].cos = -0.3136859366693505 * ((2 ** 8) - 1);
        twiddles_storage[77].sin = -0.9495267943222414 * ((2 ** 8) - 1);

        twiddles_storage[78].cos = -0.3368940684167864 * ((2 ** 8) - 1);
        twiddles_storage[78].sin = -0.9415425570124728 * ((2 ** 8) - 1);

        twiddles_storage[79].cos = -0.35989926682564644 * ((2 ** 8) - 1);
        twiddles_storage[79].sin = -0.932991167020547 * ((2 ** 8) - 1);

        twiddles_storage[80].cos = -0.3826876743598231 * ((2 ** 8) - 1);
        twiddles_storage[80].sin = -0.9238777754081272 * ((2 ** 8) - 1);

        twiddles_storage[81].cos = -0.40524556407053497 * ((2 ** 8) - 1);
        twiddles_storage[81].sin = -0.9142078717672223 * ((2 ** 8) - 1);

        twiddles_storage[82].cos = -0.42755934786496835 * ((2 ** 8) - 1);
        twiddles_storage[82].sin = -0.9039872809134446 * ((2 ** 8) - 1);

        twiddles_storage[83].cos = -0.4496155846912724 * ((2 ** 8) - 1);
        twiddles_storage[83].sin = -0.893222159377344 * ((2 ** 8) - 1);

        twiddles_storage[84].cos = -0.47140098863498625 * ((2 ** 8) - 1);
        twiddles_storage[84].sin = -0.8819189916959252 * ((2 ** 8) - 1);

        twiddles_storage[85].cos = -0.49290243692201197 * ((2 ** 8) - 1);
        twiddles_storage[85].sin = -0.870084586506589 * ((2 ** 8) - 1);

        twiddles_storage[86].cos = -0.5141069778233224 * ((2 ** 8) - 1);
        twiddles_storage[86].sin = -0.8577260724458421 * ((2 ** 8) - 1);

        twiddles_storage[87].cos = -0.535001838456634 * ((2 ** 8) - 1);
        twiddles_storage[87].sin = -0.844850893855254 * ((2 ** 8) - 1);

        twiddles_storage[88].cos = -0.5555744324803481 * ((2 ** 8) - 1);
        twiddles_storage[88].sin = -0.8314668062972442 * ((2 ** 8) - 1);

        twiddles_storage[89].cos = -0.5758123676751303 * ((2 ** 8) - 1);
        twiddles_storage[89].sin = -0.8175818718833977 * ((2 ** 8) - 1);

        twiddles_storage[90].cos = -0.5957034534085537 * ((2 ** 8) - 1);
        twiddles_storage[90].sin = -0.8032044544181283 * ((2 ** 8) - 1);

        twiddles_storage[91].cos = -0.6152357079783143 * ((2 ** 8) - 1);
        twiddles_storage[91].sin = -0.7883432143606124 * ((2 ** 8) - 1);

        twiddles_storage[92].cos = -0.6343973658295937 * ((2 ** 8) - 1);
        twiddles_storage[92].sin = -0.773007103608028 * ((2 ** 8) - 1);

        twiddles_storage[93].cos = -0.6531768846422242 * ((2 ** 8) - 1);
        twiddles_storage[93].sin = -0.7572053601032408 * ((2 ** 8) - 1);

        twiddles_storage[94].cos = -0.6715629522833823 * ((2 ** 8) - 1);
        twiddles_storage[94].sin = -0.7409475022701862 * ((2 ** 8) - 1);

        twiddles_storage[95].cos = -0.6895444936216253 * ((2 ** 8) - 1);
        twiddles_storage[95].sin = -0.7242433232803022 * ((2 ** 8) - 1);

        twiddles_storage[96].cos = -0.7071106771981701 * ((2 ** 8) - 1);
        twiddles_storage[96].sin = -0.7071028851534585 * ((2 ** 8) - 1);

        twiddles_storage[97].cos = -0.7242509217513879 * ((2 ** 8) - 1);
        twiddles_storage[97].sin = -0.6895365126969455 * ((2 ** 8) - 1);

        twiddles_storage[98].cos = -0.7409549025905896 * ((2 ** 8) - 1);
        twiddles_storage[98].sin = -0.6715547872861677 * ((2 ** 8) - 1);

        twiddles_storage[99].cos = -0.7572125578152642 * ((2 ** 8) - 1);
        twiddles_storage[99].sin = -0.6531685404907872 * ((2 ** 8) - 1);

        twiddles_storage[100].cos = -0.7730140943760191 * ((2 ** 8) - 1);
        twiddles_storage[100].sin = -0.6343888475501623 * ((2 ** 8) - 1);

        twiddles_storage[101].cos = -0.7883499939735743 * ((2 ** 8) - 1);
        twiddles_storage[101].sin = -0.6152270207020051 * ((2 ** 8) - 1);

        twiddles_storage[102].cos = -0.8032110187922561 * ((2 ** 8) - 1);
        twiddles_storage[102].sin = -0.5956946023682823 * ((2 ** 8) - 1);

        twiddles_storage[103].cos = -0.8175882170645397 * ((2 ** 8) - 1);
        twiddles_storage[103].sin = -0.5758033582024571 * ((2 ** 8) - 1);

        twiddles_storage[104].cos = -0.831472928463283 * ((2 ** 8) - 1);
        twiddles_storage[104].sin = -0.5555652700022674 * ((2 ** 8) - 1);

        twiddles_storage[105].cos = -0.844856789318408 * ((2 ** 8) - 1);
        twiddles_storage[105].sin = -0.5349925284923062 * ((2 ** 8) - 1);

        twiddles_storage[106].cos = -0.857731737654888 * ((2 ** 8) - 1);
        twiddles_storage[106].sin = -0.5140975259807485 * ((2 ** 8) - 1);

        twiddles_storage[107].cos = -0.8700900180490013 * ((2 ** 8) - 1);
        twiddles_storage[107].sin = -0.4928928488946544 * ((2 ** 8) - 1);

        twiddles_storage[108].cos = -0.8819241862999303 * ((2 ** 8) - 1);
        twiddles_storage[108].sin = -0.47139127019834154 * ((2 ** 8) - 1);

        twiddles_storage[109].cos = -0.8932271139138916 * ((2 ** 8) - 1);
        twiddles_storage[109].sin = -0.44960574169939116 * ((2 ** 8) - 1);

        twiddles_storage[110].cos = -0.9039919923980938 * ((2 ** 8) - 1);
        twiddles_storage[110].sin = -0.4275493862469278 * ((2 ** 8) - 1);

        twiddles_storage[111].cos = -0.9142123373619373 * ((2 ** 8) - 1);
        twiddles_storage[111].sin = -0.40523548982687 * ((2 ** 8) - 1);

        twiddles_storage[112].cos = -0.9238819924229884 * ((2 ** 8) - 1);
        twiddles_storage[112].sin = -0.3826774935589095 * ((2 ** 8) - 1);

        twiddles_storage[113].cos = -0.9329951329153702 * ((2 ** 8) - 1);
        twiddles_storage[113].sin = -0.359888985600047 * ((2 ** 8) - 1);

        twiddles_storage[114].cos = -0.9415462693983404 * ((2 ** 8) - 1);
        twiddles_storage[114].sin = -0.33688369295955517 * ((2 ** 8) - 1);

        twiddles_storage[115].cos = -0.9495302509629402 * ((2 ** 8) - 1);
        twiddles_storage[115].sin = -0.313675473230305 * ((2 ** 8) - 1);

        twiddles_storage[116].cos = -0.9569422683347245 * ((2 ** 8) - 1);
        twiddles_storage[116].sin = -0.2902783062414279 * ((2 ** 8) - 1);

        twiddles_storage[117].cos = -0.9637778567707017 * ((2 ** 8) - 1);
        twiddles_storage[117].sin = -0.2667062856373519 * ((2 ** 8) - 1);

        twiddles_storage[118].cos = -0.970032898748741 * ((2 ** 8) - 1);
        twiddles_storage[118].sin = -0.2429736103882782 * ((2 ** 8) - 1);

        twiddles_storage[119].cos = -0.9757036264478253 * ((2 ** 8) - 1);
        twiddles_storage[119].sin = -0.21909457623721026 * ((2 ** 8) - 1);

        twiddles_storage[120].cos = -0.9807866240176562 * ((2 ** 8) - 1);
        twiddles_storage[120].sin = -0.19508356708869376 * ((2 ** 8) - 1);

        twiddles_storage[121].cos = -0.9852788296362439 * ((2 ** 8) - 1);
        twiddles_storage[121].sin = -0.1709550463444509 * ((2 ** 8) - 1);

        twiddles_storage[122].cos = -0.989177537354244 * ((2 ** 8) - 1);
        twiddles_storage[122].sin = -0.14672354819112501 * ((2 ** 8) - 1);

        twiddles_storage[123].cos = -0.992480398724926 * ((2 ** 8) - 1);
        twiddles_storage[123].sin = -0.12240366884539047 * ((2 ** 8) - 1);

        twiddles_storage[124].cos = -0.9951854242187981 * ((2 ** 8) - 1);
        twiddles_storage[124].sin = -0.09801005776169577 * ((2 ** 8) - 1);

        twiddles_storage[125].cos = -0.9972909844220299 * ((2 ** 8) - 1);
        twiddles_storage[125].sin = -0.07355740880794037 * ((2 ** 8) - 1);

        twiddles_storage[126].cos = -0.9987958110179557 * ((2 ** 8) - 1);
        twiddles_storage[126].sin = -0.04906045141439406 * ((2 ** 8) - 1);

        twiddles_storage[127].cos = -0.999698997551064 * ((2 ** 8) - 1);
        twiddles_storage[127].sin = -0.02453394170119877 * ((2 ** 8) - 1);

    end
    generate
         genvar j;
             for (j = 0; j < $clog2(FFT_SIZE)-1; j = j + 1) begin : GEN_TWIDDLES_REGS
             always_ff @(posedge clk) twiddles[j] <= twiddles_storage[indexes[j]];
         end
    endgenerate

endmodule
