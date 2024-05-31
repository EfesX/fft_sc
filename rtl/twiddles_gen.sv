/***
  This file was generated with E:\sandbox\fpga\fft_prj\create_twiddles.py.
  This file stores twiddles coefficients for 1024-point FFT.
  Amount of ports of access to storage equals amount of stages of 1024-point FFT.
  Twiddles storage consists only first 512 coefficients.
***/

import fft_pkg::twiddle_t;
import fft_pkg::TWIDDLE_WIDTH;

module twiddles_gen #(parameter int unsigned FFT_SIZE = 1024) ( 
    input  logic                                                  clk     , 
    input  logic     [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] indexes , 
    output twiddle_t [$clog2(FFT_SIZE)-2:0]                       twiddles  
);

    localparam int unsigned TOTAL_TWIDDLES = FFT_SIZE/2;
    twiddle_t [TOTAL_TWIDDLES-1:0] twiddles_storage;

    initial begin
        twiddles_storage[0].cos = 1.0 * ((2 ** 8) - 1);
        twiddles_storage[0].sin = -0.0 * ((2 ** 8) - 1);

        twiddles_storage[1].cos = 0.9999811751945605 * ((2 ** 8) - 1);
        twiddles_storage[1].sin = -0.006135898997341804 * ((2 ** 8) - 1);

        twiddles_storage[2].cos = 0.9999247014869889 * ((2 ** 8) - 1);
        twiddles_storage[2].sin = -0.012271566980473965 * ((2 ** 8) - 1);

        twiddles_storage[3].cos = 0.999830581003498 * ((2 ** 8) - 1);
        twiddles_storage[3].sin = -0.018406772943884438 * ((2 ** 8) - 1);

        twiddles_storage[4].cos = 0.9996988172876875 * ((2 ** 8) - 1);
        twiddles_storage[4].sin = -0.02454128589945604 * ((2 ** 8) - 1);

        twiddles_storage[5].cos = 0.9995294153004101 * ((2 ** 8) - 1);
        twiddles_storage[5].sin = -0.03067487488516306 * ((2 ** 8) - 1);

        twiddles_storage[6].cos = 0.9993223814195845 * ((2 ** 8) - 1);
        twiddles_storage[6].sin = -0.03680730897376689 * ((2 ** 8) - 1);

        twiddles_storage[7].cos = 0.999077723439956 * ((2 ** 8) - 1);
        twiddles_storage[7].sin = -0.04293835728151036 * ((2 ** 8) - 1);

        twiddles_storage[8].cos = 0.9987954505728023 * ((2 ** 8) - 1);
        twiddles_storage[8].sin = -0.049067788976810404 * ((2 ** 8) - 1);

        twiddles_storage[9].cos = 0.9984755734455869 * ((2 ** 8) - 1);
        twiddles_storage[9].sin = -0.05519537328894879 * ((2 ** 8) - 1);

        twiddles_storage[10].cos = 0.9981181041015592 * ((2 ** 8) - 1);
        twiddles_storage[10].sin = -0.06132087951676053 * ((2 ** 8) - 1);

        twiddles_storage[11].cos = 0.9977230559993009 * ((2 ** 8) - 1);
        twiddles_storage[11].sin = -0.06744407703731971 * ((2 ** 8) - 1);

        twiddles_storage[12].cos = 0.9972904440122193 * ((2 ** 8) - 1);
        twiddles_storage[12].sin = -0.07356473531462235 * ((2 ** 8) - 1);

        twiddles_storage[13].cos = 0.9968202844279874 * ((2 ** 8) - 1);
        twiddles_storage[13].sin = -0.07968262390826598 * ((2 ** 8) - 1);

        twiddles_storage[14].cos = 0.9963125949479308 * ((2 ** 8) - 1);
        twiddles_storage[14].sin = -0.08579751248212567 * ((2 ** 8) - 1);

        twiddles_storage[15].cos = 0.9957673946863604 * ((2 ** 8) - 1);
        twiddles_storage[15].sin = -0.09190917081302603 * ((2 ** 8) - 1);

        twiddles_storage[16].cos = 0.9951847041698544 * ((2 ** 8) - 1);
        twiddles_storage[16].sin = -0.09801736879940907 * ((2 ** 8) - 1);

        twiddles_storage[17].cos = 0.9945645453364838 * ((2 ** 8) - 1);
        twiddles_storage[17].sin = -0.10412187646999743 * ((2 ** 8) - 1);

        twiddles_storage[18].cos = 0.9939069415349872 * ((2 ** 8) - 1);
        twiddles_storage[18].sin = -0.11022246399245275 * ((2 ** 8) - 1);

        twiddles_storage[19].cos = 0.993211917523892 * ((2 ** 8) - 1);
        twiddles_storage[19].sin = -0.11631890168202862 * ((2 ** 8) - 1);

        twiddles_storage[20].cos = 0.9924794994705819 * ((2 ** 8) - 1);
        twiddles_storage[20].sin = -0.12241096001021831 * ((2 ** 8) - 1);

        twiddles_storage[21].cos = 0.9917097149503113 * ((2 ** 8) - 1);
        twiddles_storage[21].sin = -0.1284984096133963 * ((2 ** 8) - 1);

        twiddles_storage[22].cos = 0.9909025929451681 * ((2 ** 8) - 1);
        twiddles_storage[22].sin = -0.1345810213014538 * ((2 ** 8) - 1);

        twiddles_storage[23].cos = 0.9900581638429817 * ((2 ** 8) - 1);
        twiddles_storage[23].sin = -0.1406585660664276 * ((2 ** 8) - 1);

        twiddles_storage[24].cos = 0.9891764594361792 * ((2 ** 8) - 1);
        twiddles_storage[24].sin = -0.1467308150911222 * ((2 ** 8) - 1);

        twiddles_storage[25].cos = 0.9882575129205882 * ((2 ** 8) - 1);
        twiddles_storage[25].sin = -0.15279753975772473 * ((2 ** 8) - 1);

        twiddles_storage[26].cos = 0.9873013588941877 * ((2 ** 8) - 1);
        twiddles_storage[26].sin = -0.15885851165641213 * ((2 ** 8) - 1);

        twiddles_storage[27].cos = 0.9863080333558046 * ((2 ** 8) - 1);
        twiddles_storage[27].sin = -0.16491350259395082 * ((2 ** 8) - 1);

        twiddles_storage[28].cos = 0.985277573703759 * ((2 ** 8) - 1);
        twiddles_storage[28].sin = -0.1709622846022882 * ((2 ** 8) - 1);

        twiddles_storage[29].cos = 0.9842100187344557 * ((2 ** 8) - 1);
        twiddles_storage[29].sin = -0.17700462994713534 * ((2 ** 8) - 1);

        twiddles_storage[30].cos = 0.983105408640924 * ((2 ** 8) - 1);
        twiddles_storage[30].sin = -0.18304031113654123 * ((2 ** 8) - 1);

        twiddles_storage[31].cos = 0.9819637850113041 * ((2 ** 8) - 1);
        twiddles_storage[31].sin = -0.18906910092945764 * ((2 ** 8) - 1);

        twiddles_storage[32].cos = 0.9807851908272812 * ((2 ** 8) - 1);
        twiddles_storage[32].sin = -0.19509077234429487 * ((2 ** 8) - 1);

        twiddles_storage[33].cos = 0.979569670462468 * ((2 ** 8) - 1);
        twiddles_storage[33].sin = -0.20110509866746726 * ((2 ** 8) - 1);

        twiddles_storage[34].cos = 0.9783172696807332 * ((2 ** 8) - 1);
        twiddles_storage[34].sin = -0.20711185346192904 * ((2 ** 8) - 1);

        twiddles_storage[35].cos = 0.9770280356344787 * ((2 ** 8) - 1);
        twiddles_storage[35].sin = -0.21311081057569964 * ((2 ** 8) - 1);

        twiddles_storage[36].cos = 0.975702016862865 * ((2 ** 8) - 1);
        twiddles_storage[36].sin = -0.21910174415037792 * ((2 ** 8) - 1);

        twiddles_storage[37].cos = 0.9743392632899824 * ((2 ** 8) - 1);
        twiddles_storage[37].sin = -0.2250844286296461 * ((2 ** 8) - 1);

        twiddles_storage[38].cos = 0.9729398262229731 * ((2 ** 8) - 1);
        twiddles_storage[38].sin = -0.23105863876776142 * ((2 ** 8) - 1);

        twiddles_storage[39].cos = 0.971503758350098 * ((2 ** 8) - 1);
        twiddles_storage[39].sin = -0.237024149638037 * ((2 ** 8) - 1);

        twiddles_storage[40].cos = 0.9700311137387535 * ((2 ** 8) - 1);
        twiddles_storage[40].sin = -0.24298073664130976 * ((2 ** 8) - 1);

        twiddles_storage[41].cos = 0.9685219478334364 * ((2 ** 8) - 1);
        twiddles_storage[41].sin = -0.24892817551439692 * ((2 ** 8) - 1);

        twiddles_storage[42].cos = 0.9669763174536556 * ((2 ** 8) - 1);
        twiddles_storage[42].sin = -0.2548662423385392 * ((2 ** 8) - 1);

        twiddles_storage[43].cos = 0.9653942807917937 * ((2 ** 8) - 1);
        twiddles_storage[43].sin = -0.26079471354783124 * ((2 ** 8) - 1);

        twiddles_storage[44].cos = 0.9637758974109153 * ((2 ** 8) - 1);
        twiddles_storage[44].sin = -0.26671336593763895 * ((2 ** 8) - 1);

        twiddles_storage[45].cos = 0.9621212282425249 * ((2 ** 8) - 1);
        twiddles_storage[45].sin = -0.27262197667300286 * ((2 ** 8) - 1);

        twiddles_storage[46].cos = 0.9604303355842728 * ((2 ** 8) - 1);
        twiddles_storage[46].sin = -0.2785203232970281 * ((2 ** 8) - 1);

        twiddles_storage[47].cos = 0.9587032830976098 * ((2 ** 8) - 1);
        twiddles_storage[47].sin = -0.2844081837392593 * ((2 ** 8) - 1);

        twiddles_storage[48].cos = 0.9569401358053898 * ((2 ** 8) - 1);
        twiddles_storage[48].sin = -0.2902853363240419 * ((2 ** 8) - 1);

        twiddles_storage[49].cos = 0.9551409600894224 * ((2 ** 8) - 1);
        twiddles_storage[49].sin = -0.29615155977886815 * ((2 ** 8) - 1);

        twiddles_storage[50].cos = 0.9533058236879731 * ((2 ** 8) - 1);
        twiddles_storage[50].sin = -0.30200663324270743 * ((2 ** 8) - 1);

        twiddles_storage[51].cos = 0.9514347956932133 * ((2 ** 8) - 1);
        twiddles_storage[51].sin = -0.3078503362743224 * ((2 ** 8) - 1);

        twiddles_storage[52].cos = 0.9495279465486192 * ((2 ** 8) - 1);
        twiddles_storage[52].sin = -0.3136824488605677 * ((2 ** 8) - 1);

        twiddles_storage[53].cos = 0.9475853480463188 * ((2 ** 8) - 1);
        twiddles_storage[53].sin = -0.31950275142467377 * ((2 ** 8) - 1);

        twiddles_storage[54].cos = 0.94560707332439 * ((2 ** 8) - 1);
        twiddles_storage[54].sin = -0.325311024834514 * ((2 ** 8) - 1);

        twiddles_storage[55].cos = 0.9435931968641061 * ((2 ** 8) - 1);
        twiddles_storage[55].sin = -0.3311070504108547 * ((2 ** 8) - 1);

        twiddles_storage[56].cos = 0.9415437944871324 * ((2 ** 8) - 1);
        twiddles_storage[56].sin = -0.33689060993558806 * ((2 ** 8) - 1);

        twiddles_storage[57].cos = 0.9394589433526709 * ((2 ** 8) - 1);
        twiddles_storage[57].sin = -0.3426614856599487 * ((2 ** 8) - 1);

        twiddles_storage[58].cos = 0.9373387219545554 * ((2 ** 8) - 1);
        twiddles_storage[58].sin = -0.3484194603127109 * ((2 ** 8) - 1);

        twiddles_storage[59].cos = 0.9351832101182965 * ((2 ** 8) - 1);
        twiddles_storage[59].sin = -0.3541643171083699 * ((2 ** 8) - 1);

        twiddles_storage[60].cos = 0.9329924889980764 * ((2 ** 8) - 1);
        twiddles_storage[60].sin = -0.3598958397553025 * ((2 ** 8) - 1);

        twiddles_storage[61].cos = 0.9307666410736924 * ((2 ** 8) - 1);
        twiddles_storage[61].sin = -0.36561381246391134 * ((2 ** 8) - 1);

        twiddles_storage[62].cos = 0.9285057501474531 * ((2 ** 8) - 1);
        twiddles_storage[62].sin = -0.371318019954749 * ((2 ** 8) - 1);

        twiddles_storage[63].cos = 0.9262099013410219 * ((2 ** 8) - 1);
        twiddles_storage[63].sin = -0.37700824746662304 * ((2 ** 8) - 1);

        twiddles_storage[64].cos = 0.923879181092213 * ((2 ** 8) - 1);
        twiddles_storage[64].sin = -0.38268428076468186 * ((2 ** 8) - 1);

        twiddles_storage[65].cos = 0.9215136771517369 * ((2 ** 8) - 1);
        twiddles_storage[65].sin = -0.3883459061484804 * ((2 ** 8) - 1);

        twiddles_storage[66].cos = 0.9191134785798966 * ((2 ** 8) - 1);
        twiddles_storage[66].sin = -0.39399291046002605 * ((2 ** 8) - 1);

        twiddles_storage[67].cos = 0.916678675743234 * ((2 ** 8) - 1);
        twiddles_storage[67].sin = -0.39962508109180384 * ((2 ** 8) - 1);

        twiddles_storage[68].cos = 0.9142093603111289 * ((2 ** 8) - 1);
        twiddles_storage[68].sin = -0.40524220599478106 * ((2 ** 8) - 1);

        twiddles_storage[69].cos = 0.9117056252523461 * ((2 ** 8) - 1);
        twiddles_storage[69].sin = -0.4108440736863909 * ((2 ** 8) - 1);

        twiddles_storage[70].cos = 0.9091675648315366 * ((2 ** 8) - 1);
        twiddles_storage[70].sin = -0.41643047325849464 * ((2 ** 8) - 1);

        twiddles_storage[71].cos = 0.9065952746056873 * ((2 ** 8) - 1);
        twiddles_storage[71].sin = -0.42200119438532196 * ((2 ** 8) - 1);

        twiddles_storage[72].cos = 0.9039888514205247 * ((2 ** 8) - 1);
        twiddles_storage[72].sin = -0.4275560273313903 * ((2 ** 8) - 1);

        twiddles_storage[73].cos = 0.9013483934068671 * ((2 ** 8) - 1);
        twiddles_storage[73].sin = -0.4330947629594007 * ((2 ** 8) - 1);

        twiddles_storage[74].cos = 0.8986739999769315 * ((2 ** 8) - 1);
        twiddles_storage[74].sin = -0.438617192738112 * ((2 ** 8) - 1);

        twiddles_storage[75].cos = 0.8959657718205898 * ((2 ** 8) - 1);
        twiddles_storage[75].sin = -0.4441231087501919 * ((2 ** 8) - 1);

        twiddles_storage[76].cos = 0.8932238109015783 * ((2 ** 8) - 1);
        twiddles_storage[76].sin = -0.449612303700045 * ((2 ** 8) - 1);

        twiddles_storage[77].cos = 0.8904482204536586 * ((2 ** 8) - 1);
        twiddles_storage[77].sin = -0.4550845709216175 * ((2 ** 8) - 1);

        twiddles_storage[78].cos = 0.8876391049767309 * ((2 ** 8) - 1);
        twiddles_storage[78].sin = -0.46053970438617786 * ((2 ** 8) - 1);

        twiddles_storage[79].cos = 0.8847965702329 * ((2 ** 8) - 1);
        twiddles_storage[79].sin = -0.4659774987100737 * ((2 ** 8) - 1);

        twiddles_storage[80].cos = 0.8819207232424929 * ((2 ** 8) - 1);
        twiddles_storage[80].sin = -0.4713977491624649 * ((2 ** 8) - 1);

        twiddles_storage[81].cos = 0.8790116722800297 * ((2 ** 8) - 1);
        twiddles_storage[81].sin = -0.47680025167303086 * ((2 ** 8) - 1);

        twiddles_storage[82].cos = 0.8760695268701472 * ((2 ** 8) - 1);
        twiddles_storage[82].sin = -0.4821848028396544 * ((2 ** 8) - 1);

        twiddles_storage[83].cos = 0.8730943977834752 * ((2 ** 8) - 1);
        twiddles_storage[83].sin = -0.48755119993607937 * ((2 ** 8) - 1);

        twiddles_storage[84].cos = 0.870086397032466 * ((2 ** 8) - 1);
        twiddles_storage[84].sin = -0.49289924091954324 * ((2 ** 8) - 1);

        twiddles_storage[85].cos = 0.8670456378671776 * ((2 ** 8) - 1);
        twiddles_storage[85].sin = -0.4982287244383839 * ((2 ** 8) - 1);

        twiddles_storage[86].cos = 0.8639722347710094 * ((2 ** 8) - 1);
        twiddles_storage[86].sin = -0.5035394498396207 * ((2 ** 8) - 1);

        twiddles_storage[87].cos = 0.8608663034563917 * ((2 ** 8) - 1);
        twiddles_storage[87].sin = -0.5088312171765091 * ((2 ** 8) - 1);

        twiddles_storage[88].cos = 0.8577279608604302 * ((2 ** 8) - 1);
        twiddles_storage[88].sin = -0.5141038272160676 * ((2 ** 8) - 1);

        twiddles_storage[89].cos = 0.8545573251405024 * ((2 ** 8) - 1);
        twiddles_storage[89].sin = -0.5193570814465801 * ((2 ** 8) - 1);

        twiddles_storage[90].cos = 0.8513545156698094 * ((2 ** 8) - 1);
        twiddles_storage[90].sin = -0.5245907820850689 * ((2 ** 8) - 1);

        twiddles_storage[91].cos = 0.8481196530328813 * ((2 ** 8) - 1);
        twiddles_storage[91].sin = -0.5298047320847418 * ((2 ** 8) - 1);

        twiddles_storage[92].cos = 0.8448528590210379 * ((2 ** 8) - 1);
        twiddles_storage[92].sin = -0.5349987351424097 * ((2 ** 8) - 1);

        twiddles_storage[93].cos = 0.8415542566278025 * ((2 ** 8) - 1);
        twiddles_storage[93].sin = -0.5401725957058788 * ((2 ** 8) - 1);

        twiddles_storage[94].cos = 0.8382239700442715 * ((2 ** 8) - 1);
        twiddles_storage[94].sin = -0.5453261189813122 * ((2 ** 8) - 1);

        twiddles_storage[95].cos = 0.834862124654439 * ((2 ** 8) - 1);
        twiddles_storage[95].sin = -0.5504591109405639 * ((2 ** 8) - 1);

        twiddles_storage[96].cos = 0.8314688470304757 * ((2 ** 8) - 1);
        twiddles_storage[96].sin = -0.5555713783284838 * ((2 ** 8) - 1);

        twiddles_storage[97].cos = 0.8280442649279639 * ((2 ** 8) - 1);
        twiddles_storage[97].sin = -0.5606627286701944 * ((2 ** 8) - 1);

        twiddles_storage[98].cos = 0.824588507281087 * ((2 ** 8) - 1);
        twiddles_storage[98].sin = -0.5657329702783361 * ((2 ** 8) - 1);

        twiddles_storage[99].cos = 0.8211017041977758 * ((2 ** 8) - 1);
        twiddles_storage[99].sin = -0.5707819122602855 * ((2 ** 8) - 1);

        twiddles_storage[100].cos = 0.8175839869548096 * ((2 ** 8) - 1);
        twiddles_storage[100].sin = -0.5758093645253416 * ((2 ** 8) - 1);

        twiddles_storage[101].cos = 0.8140354879928736 * ((2 ** 8) - 1);
        twiddles_storage[101].sin = -0.580815137791883 * ((2 ** 8) - 1);

        twiddles_storage[102].cos = 0.8104563409115733 * ((2 ** 8) - 1);
        twiddles_storage[102].sin = -0.5857990435944939 * ((2 ** 8) - 1);

        twiddles_storage[103].cos = 0.8068466804644032 * ((2 ** 8) - 1);
        twiddles_storage[103].sin = -0.5907608942910603 * ((2 ** 8) - 1);

        twiddles_storage[104].cos = 0.8032066425536747 * ((2 ** 8) - 1);
        twiddles_storage[104].sin = -0.5957005030698341 * ((2 ** 8) - 1);

        twiddles_storage[105].cos = 0.7995363642253988 * ((2 ** 8) - 1);
        twiddles_storage[105].sin = -0.600617683956467 * ((2 ** 8) - 1);

        twiddles_storage[106].cos = 0.7958359836641262 * ((2 ** 8) - 1);
        twiddles_storage[106].sin = -0.605512251821012 * ((2 ** 8) - 1);

        twiddles_storage[107].cos = 0.7921056401877453 * ((2 ** 8) - 1);
        twiddles_storage[107].sin = -0.6103840223848935 * ((2 ** 8) - 1);

        twiddles_storage[108].cos = 0.7883454742422363 * ((2 ** 8) - 1);
        twiddles_storage[108].sin = -0.6152328122278455 * ((2 ** 8) - 1);

        twiddles_storage[109].cos = 0.7845556273963841 * ((2 ** 8) - 1);
        twiddles_storage[109].sin = -0.6200584387948173 * ((2 ** 8) - 1);

        twiddles_storage[110].cos = 0.7807362423364475 * ((2 ** 8) - 1);
        twiddles_storage[110].sin = -0.6248607204028462 * ((2 ** 8) - 1);

        twiddles_storage[111].cos = 0.7768874628607879 * ((2 ** 8) - 1);
        twiddles_storage[111].sin = -0.6296394762478985 * ((2 ** 8) - 1);

        twiddles_storage[112].cos = 0.7730094338744549 * ((2 ** 8) - 1);
        twiddles_storage[112].sin = -0.634394526411676 * ((2 ** 8) - 1);

        twiddles_storage[113].cos = 0.7691023013837308 * ((2 ** 8) - 1);
        twiddles_storage[113].sin = -0.6391256918683905 * ((2 ** 8) - 1);

        twiddles_storage[114].cos = 0.7651662124906335 * ((2 ** 8) - 1);
        twiddles_storage[114].sin = -0.6438327944915035 * ((2 ** 8) - 1);

        twiddles_storage[115].cos = 0.7612013153873785 * ((2 ** 8) - 1);
        twiddles_storage[115].sin = -0.6485156570604328 * ((2 ** 8) - 1);

        twiddles_storage[116].cos = 0.7572077593507985 * ((2 ** 8) - 1);
        twiddles_storage[116].sin = -0.6531741032672248 * ((2 ** 8) - 1);

        twiddles_storage[117].cos = 0.7531856947367244 * ((2 ** 8) - 1);
        twiddles_storage[117].sin = -0.6578079577231928 * ((2 ** 8) - 1);

        twiddles_storage[118].cos = 0.749135272974324 * ((2 ** 8) - 1);
        twiddles_storage[118].sin = -0.6624170459655193 * ((2 ** 8) - 1);

        twiddles_storage[119].cos = 0.7450566465604006 * ((2 ** 8) - 1);
        twiddles_storage[119].sin = -0.6670011944638258 * ((2 ** 8) - 1);

        twiddles_storage[120].cos = 0.7409499690536513 * ((2 ** 8) - 1);
        twiddles_storage[120].sin = -0.671560230626705 * ((2 ** 8) - 1);

        twiddles_storage[121].cos = 0.7368153950688865 * ((2 ** 8) - 1);
        twiddles_storage[121].sin = -0.6760939828082193 * ((2 ** 8) - 1);

        twiddles_storage[122].cos = 0.7326530802712078 * ((2 ** 8) - 1);
        twiddles_storage[122].sin = -0.6806022803143633 * ((2 ** 8) - 1);

        twiddles_storage[123].cos = 0.7284631813701476 * ((2 ** 8) - 1);
        twiddles_storage[123].sin = -0.6850849534094902 * ((2 ** 8) - 1);

        twiddles_storage[124].cos = 0.7242458561137692 * ((2 ** 8) - 1);
        twiddles_storage[124].sin = -0.6895418333227024 * ((2 ** 8) - 1);

        twiddles_storage[125].cos = 0.7200012632827276 * ((2 ** 8) - 1);
        twiddles_storage[125].sin = -0.6939727522542051 * ((2 ** 8) - 1);

        twiddles_storage[126].cos = 0.7157295626842911 * ((2 ** 8) - 1);
        twiddles_storage[126].sin = -0.6983775433816249 * ((2 ** 8) - 1);

        twiddles_storage[127].cos = 0.7114309151463248 * ((2 ** 8) - 1);
        twiddles_storage[127].sin = -0.70275604086629 * ((2 ** 8) - 1);

        twiddles_storage[128].cos = 0.7071054825112363 * ((2 ** 8) - 1);
        twiddles_storage[128].sin = -0.7071080798594735 * ((2 ** 8) - 1);

        twiddles_storage[129].cos = 0.7027534276298809 * ((2 ** 8) - 1);
        twiddles_storage[129].sin = -0.7114334965086011 * ((2 ** 8) - 1);

        twiddles_storage[130].cos = 0.6983749143554313 * ((2 ** 8) - 1);
        twiddles_storage[130].sin = -0.715732127963419 * ((2 ** 8) - 1);

        twiddles_storage[131].cos = 0.6939701075372087 * ((2 ** 8) - 1);
        twiddles_storage[131].sin = -0.7200038123821255 * ((2 ** 8) - 1);

        twiddles_storage[132].cos = 0.6895391730144758 * ((2 ** 8) - 1);
        twiddles_storage[132].sin = -0.7242483889374645 * ((2 ** 8) - 1);

        twiddles_storage[133].cos = 0.685082277610193 * ((2 ** 8) - 1);
        twiddles_storage[133].sin = -0.7284656978227804 * ((2 ** 8) - 1);

        twiddles_storage[134].cos = 0.6805995891247384 * ((2 ** 8) - 1);
        twiddles_storage[134].sin = -0.7326555802580346 * ((2 ** 8) - 1);

        twiddles_storage[135].cos = 0.6760912763295888 * ((2 ** 8) - 1);
        twiddles_storage[135].sin = -0.7368178784957837 * ((2 ** 8) - 1);

        twiddles_storage[136].cos = 0.6715575089609669 * ((2 ** 8) - 1);
        twiddles_storage[136].sin = -0.740952435827119 * ((2 ** 8) - 1);

        twiddles_storage[137].cos = 0.6669984577134496 * ((2 ** 8) - 1);
        twiddles_storage[137].sin = -0.7450590965875658 * ((2 ** 8) - 1);

        twiddles_storage[138].cos = 0.6624142942335427 * ((2 ** 8) - 1);
        twiddles_storage[138].sin = -0.7491377061629441 * ((2 ** 8) - 1);

        twiddles_storage[139].cos = 0.6578051911132173 * ((2 ** 8) - 1);
        twiddles_storage[139].sin = -0.7531881109951906 * ((2 ** 8) - 1);

        twiddles_storage[140].cos = 0.6531713218834124 * ((2 ** 8) - 1);
        twiddles_storage[140].sin = -0.7572101585881397 * ((2 ** 8) - 1);

        twiddles_storage[141].cos = 0.6485128610075014 * ((2 ** 8) - 1);
        twiddles_storage[141].sin = -0.7612036975132643 * ((2 ** 8) - 1);

        twiddles_storage[142].cos = 0.6438299838747235 * ((2 ** 8) - 1);
        twiddles_storage[142].sin = -0.765168577415378 * ((2 ** 8) - 1);

        twiddles_storage[143].cos = 0.6391228667935804 * ((2 ** 8) - 1);
        twiddles_storage[143].sin = -0.7691046490182953 * ((2 ** 8) - 1);

        twiddles_storage[144].cos = 0.6343916869851989 * ((2 ** 8) - 1);
        twiddles_storage[144].sin = -0.773011764130452 * ((2 ** 8) - 1);

        twiddles_storage[145].cos = 0.6296366225766575 * ((2 ** 8) - 1);
        twiddles_storage[145].sin = -0.7768897756504842 * ((2 ** 8) - 1);

        twiddles_storage[146].cos = 0.6248578525942811 * ((2 ** 8) - 1);
        twiddles_storage[146].sin = -0.7807385375727676 * ((2 ** 8) - 1);

        twiddles_storage[147].cos = 0.6200555569568997 * ((2 ** 8) - 1);
        twiddles_storage[147].sin = -0.7845579049929131 * ((2 ** 8) - 1);

        twiddles_storage[148].cos = 0.6152299164690759 * ((2 ** 8) - 1);
        twiddles_storage[148].sin = -0.7883477341132237 * ((2 ** 8) - 1);

        twiddles_storage[149].cos = 0.6103811128142957 * ((2 ** 8) - 1);
        twiddles_storage[149].sin = -0.7921078822481076 * ((2 ** 8) - 1);

        twiddles_storage[150].cos = 0.6055093285481304 * ((2 ** 8) - 1);
        twiddles_storage[150].sin = -0.7958382078294509 * ((2 ** 8) - 1);

        twiddles_storage[151].cos = 0.6006147470913618 * ((2 ** 8) - 1);
        twiddles_storage[151].sin = -0.7995385704119468 * ((2 ** 8) - 1);

        twiddles_storage[152].cos = 0.5956975527230769 * ((2 ** 8) - 1);
        twiddles_storage[152].sin = -0.803208830678384 * ((2 ** 8) - 1);

        twiddles_storage[153].cos = 0.5907579305737305 * ((2 ** 8) - 1);
        twiddles_storage[153].sin = -0.8068488504448919 * ((2 ** 8) - 1);

        twiddles_storage[154].cos = 0.5857960666181745 * ((2 ** 8) - 1);
        twiddles_storage[154].sin = -0.8104584926661422 * ((2 ** 8) - 1);

        twiddles_storage[155].cos = 0.580812147668656 * ((2 ** 8) - 1);
        twiddles_storage[155].sin = -0.8140376214405103 * ((2 ** 8) - 1);

        twiddles_storage[156].cos = 0.5758063613677837 * ((2 ** 8) - 1);
        twiddles_storage[156].sin = -0.8175861020151903 * ((2 ** 8) - 1);

        twiddles_storage[157].cos = 0.5707788961814647 * ((2 ** 8) - 1);
        twiddles_storage[157].sin = -0.8211038007912694 * ((2 ** 8) - 1);

        twiddles_storage[158].cos = 0.5657299413918064 * ((2 ** 8) - 1);
        twiddles_storage[158].sin = -0.8245905853287577 * ((2 ** 8) - 1);

        twiddles_storage[159].cos = 0.5606596870899923 * ((2 ** 8) - 1);
        twiddles_storage[159].sin = -0.8280463243515739 * ((2 ** 8) - 1);

        twiddles_storage[160].cos = 0.5555683241691236 * ((2 ** 8) - 1);
        twiddles_storage[160].sin = -0.8314708877524887 * ((2 ** 8) - 1);

        twiddles_storage[161].cos = 0.5504560443170334 * ((2 ** 8) - 1);
        twiddles_storage[161].sin = -0.8348641465980223 * ((2 ** 8) - 1);

        twiddles_storage[162].cos = 0.5453230400090688 * ((2 ** 8) - 1);
        twiddles_storage[162].sin = -0.8382259731332998 * ((2 ** 8) - 1);

        twiddles_storage[163].cos = 0.5401695045008446 * ((2 ** 8) - 1);
        twiddles_storage[163].sin = -0.8415562407868603 * ((2 ** 8) - 1);

        twiddles_storage[164].cos = 0.5349956318209671 * ((2 ** 8) - 1);
        twiddles_storage[164].sin = -0.8448548241754226 * ((2 ** 8) - 1);

        twiddles_storage[165].cos = 0.5298016167637297 * ((2 ** 8) - 1);
        twiddles_storage[165].sin = -0.8481215991086054 * ((2 ** 8) - 1);

        twiddles_storage[166].cos = 0.5245876548817784 * ((2 ** 8) - 1);
        twiddles_storage[166].sin = -0.8513564425936038 * ((2 ** 8) - 1);

        twiddles_storage[167].cos = 0.5193539424787487 * ((2 ** 8) - 1);
        twiddles_storage[167].sin = -0.8545592328398194 * ((2 ** 8) - 1);

        twiddles_storage[168].cos = 0.5141006766018762 * ((2 ** 8) - 1);
        twiddles_storage[168].sin = -0.8577298492634456 * ((2 ** 8) - 1);

        twiddles_storage[169].cos = 0.5088280550345773 * ((2 ** 8) - 1);
        twiddles_storage[169].sin = -0.8608681724920078 * ((2 ** 8) - 1);

        twiddles_storage[170].cos = 0.5035362762890019 * ((2 ** 8) - 1);
        twiddles_storage[170].sin = -0.8639740843688577 * ((2 ** 8) - 1);

        twiddles_storage[171].cos = 0.4982255395985608 * ((2 ** 8) - 1);
        twiddles_storage[171].sin = -0.8670474679576217 * ((2 ** 8) - 1);

        twiddles_storage[172].cos = 0.4928960449104241 * ((2 ** 8) - 1);
        twiddles_storage[172].sin = -0.8700882075466034 * ((2 ** 8) - 1);

        twiddles_storage[173].cos = 0.48754799287799255 * ((2 ** 8) - 1);
        twiddles_storage[173].sin = -0.8730961886531409 * ((2 ** 8) - 1);

        twiddles_storage[174].cos = 0.48218158485334445 * ((2 ** 8) - 1);
        twiddles_storage[174].sin = -0.8760712980279156 * ((2 ** 8) - 1);

        twiddles_storage[175].cos = 0.4767970228796538 * ((2 ** 8) - 1);
        twiddles_storage[175].sin = -0.8790134236592174 * ((2 ** 8) - 1);

        twiddles_storage[176].cos = 0.4713945096835833 * ((2 ** 8) - 1);
        twiddles_storage[176].sin = -0.8819224547771612 * ((2 ** 8) - 1);

        twiddles_storage[177].cos = 0.465974248667653 * ((2 ** 8) - 1);
        twiddles_storage[177].sin = -0.8847982818578572 * ((2 ** 8) - 1);

        twiddles_storage[178].cos = 0.46053644390258064 * ((2 ** 8) - 1);
        twiddles_storage[178].sin = -0.8876407966275351 * ((2 ** 8) - 1);

        twiddles_storage[179].cos = 0.45508130011959974 * ((2 ** 8) - 1);
        twiddles_storage[179].sin = -0.8904498920666197 * ((2 ** 8) - 1);

        twiddles_storage[180].cos = 0.4496090227027513 * ((2 ** 8) - 1);
        twiddles_storage[180].sin = -0.8932254624137608 * ((2 ** 8) - 1);

        twiddles_storage[181].cos = 0.4441198176811503 * ((2 ** 8) - 1);
        twiddles_storage[181].sin = -0.895967403169815 * ((2 ** 8) - 1);

        twiddles_storage[182].cos = 0.43861389172122994 * ((2 ** 8) - 1);
        twiddles_storage[182].sin = -0.8986756111017796 * ((2 ** 8) - 1);

        twiddles_storage[183].cos = 0.4330914521189605 * ((2 ** 8) - 1);
        twiddles_storage[183].sin = -0.9013499842466799 * ((2 ** 8) - 1);

        twiddles_storage[184].cos = 0.42755270679204355 * ((2 ** 8) - 1);
        twiddles_storage[184].sin = -0.9039904219154077 * ((2 ** 8) - 1);

        twiddles_storage[185].cos = 0.42199786427208563 * ((2 ** 8) - 1);
        twiddles_storage[185].sin = -0.9065968246965121 * ((2 ** 8) - 1);

        twiddles_storage[186].cos = 0.4164271336967464 * ((2 ** 8) - 1);
        twiddles_storage[186].sin = -0.9091690944599427 * ((2 ** 8) - 1);

        twiddles_storage[187].cos = 0.41084072480186384 * ((2 ** 8) - 1);
        twiddles_storage[187].sin = -0.9117071343607437 * ((2 ** 8) - 1);

        twiddles_storage[188].cos = 0.40523884791355935 * ((2 ** 8) - 1);
        twiddles_storage[188].sin = -0.9142108488427005 * ((2 ** 8) - 1);

        twiddles_storage[189].cos = 0.3996217139403181 * ((2 ** 8) - 1);
        twiddles_storage[189].sin = -0.9166801436419372 * ((2 ** 8) - 1);

        twiddles_storage[190].cos = 0.393989534365048 * ((2 ** 8) - 1);
        twiddles_storage[190].sin = -0.9191149257904654 * ((2 ** 8) - 1);

        twiddles_storage[191].cos = 0.3883425212371187 * ((2 ** 8) - 1);
        twiddles_storage[191].sin = -0.9215151036196846 * ((2 ** 8) - 1);

        twiddles_storage[192].cos = 0.38268088716437737 * ((2 ** 8) - 1);
        twiddles_storage[192].sin = -0.9238805867638334 * ((2 ** 8) - 1);

        twiddles_storage[193].cos = 0.3770048453051433 * ((2 ** 8) - 1);
        twiddles_storage[193].sin = -0.9262112861633921 * ((2 ** 8) - 1);

        twiddles_storage[194].cos = 0.37131460936018396 * ((2 ** 8) - 1);
        twiddles_storage[194].sin = -0.9285071140684351 * ((2 ** 8) - 1);

        twiddles_storage[195].cos = 0.36561039356466885 * ((2 ** 8) - 1);
        twiddles_storage[195].sin = -0.9307679840419351 * ((2 ** 8) - 1);

        twiddles_storage[196].cos = 0.3598924126801025 * ((2 ** 8) - 1);
        twiddles_storage[196].sin = -0.9329938109630175 * ((2 ** 8) - 1);

        twiddles_storage[197].cos = 0.3541608819862405 * ((2 ** 8) - 1);
        twiddles_storage[197].sin = -0.9351845110301646 * ((2 ** 8) - 1);

        twiddles_storage[198].cos = 0.34841601727298344 * ((2 ** 8) - 1);
        twiddles_storage[198].sin = -0.9373400017643716 * ((2 ** 8) - 1);

        twiddles_storage[199].cos = 0.3426580348322518 * ((2 ** 8) - 1);
        twiddles_storage[199].sin = -0.9394602020122509 * ((2 ** 8) - 1);

        twiddles_storage[200].cos = 0.3368871514498445 * ((2 ** 8) - 1);
        twiddles_storage[200].sin = -0.9415450319490882 * ((2 ** 8) - 1);

        twiddles_storage[201].cos = 0.3311035843972748 * ((2 ** 8) - 1);
        twiddles_storage[201].sin = -0.9435944130818478 * ((2 ** 8) - 1);

        twiddles_storage[202].cos = 0.32530755142359186 * ((2 ** 8) - 1);
        twiddles_storage[202].sin = -0.9456082682521273 * ((2 ** 8) - 1);

        twiddles_storage[203].cos = 0.31949927074718215 * ((2 ** 8) - 1);
        twiddles_storage[203].sin = -0.9475865216390632 * ((2 ** 8) - 1);

        twiddles_storage[204].cos = 0.3136789610475525 * ((2 ** 8) - 1);
        twiddles_storage[204].sin = -0.9495290987621854 * ((2 ** 8) - 1);

        twiddles_storage[205].cos = 0.30784684145709845 * ((2 ** 8) - 1);
        twiddles_storage[205].sin = -0.951435926484221 * ((2 ** 8) - 1);

        twiddles_storage[206].cos = 0.3020031315528535 * ((2 ** 8) - 1);
        twiddles_storage[206].sin = -0.9533069330138483 * ((2 ** 8) - 1);

        twiddles_storage[207].cos = 0.2961480513482212 * ((2 ** 8) - 1);
        twiddles_storage[207].sin = -0.9551420479083995 * ((2 ** 8) - 1);

        twiddles_storage[208].cos = 0.2902818212846931 * ((2 ** 8) - 1);
        twiddles_storage[208].sin = -0.9569412020765129 * ((2 ** 8) - 1);

        twiddles_storage[209].cos = 0.2844046622235486 * ((2 ** 8) - 1);
        twiddles_storage[209].sin = -0.9587043277807341 * ((2 ** 8) - 1);

        twiddles_storage[210].cos = 0.27851679543753904 * ((2 ** 8) - 1);
        twiddles_storage[210].sin = -0.9604313586400665 * ((2 ** 8) - 1);

        twiddles_storage[211].cos = 0.272618442602558 * ((2 ** 8) - 1);
        twiddles_storage[211].sin = -0.9621222296324702 * ((2 ** 8) - 1);

        twiddles_storage[212].cos = 0.26670982578929486 * ((2 ** 8) - 1);
        twiddles_storage[212].sin = -0.9637768770973103 * ((2 ** 8) - 1);

        twiddles_storage[213].cos = 0.2607911674548729 * ((2 ** 8) - 1);
        twiddles_storage[213].sin = -0.9653952387377537 * ((2 ** 8) - 1);

        twiddles_storage[214].cos = 0.2548626904344756 * ((2 ** 8) - 1);
        twiddles_storage[214].sin = -0.9669772536231143 * ((2 ** 8) - 1);

        twiddles_storage[215].cos = 0.24892461793295617 * ((2 ** 8) - 1);
        twiddles_storage[215].sin = -0.9685228621911471 * ((2 ** 8) - 1);

        twiddles_storage[216].cos = 0.24297717351643314 * ((2 ** 8) - 1);
        twiddles_storage[216].sin = -0.9700320062502913 * ((2 ** 8) - 1);

        twiddles_storage[217].cos = 0.23702058110387478 * ((2 ** 8) - 1);
        twiddles_storage[217].sin = -0.9715046289818601 * ((2 ** 8) - 1);

        twiddles_storage[218].cos = 0.2310550649586678 * ((2 ** 8) - 1);
        twiddles_storage[218].sin = -0.9729406749421805 * ((2 ** 8) - 1);

        twiddles_storage[219].cos = 0.22508084968017328 * ((2 ** 8) - 1);
        twiddles_storage[219].sin = -0.9743400900646813 * ((2 ** 8) - 1);

        twiddles_storage[220].cos = 0.21909816019527203 * ((2 ** 8) - 1);
        twiddles_storage[220].sin = -0.9757028216619275 * ((2 ** 8) - 1);

        twiddles_storage[221].cos = 0.21310722174989535 * ((2 ** 8) - 1);
        twiddles_storage[221].sin = -0.9770288184276045 * ((2 ** 8) - 1);

        twiddles_storage[222].cos = 0.20710825990054413 * ((2 ** 8) - 1);
        twiddles_storage[222].sin = -0.9783180304384503 * ((2 ** 8) - 1);

        twiddles_storage[223].cos = 0.20110150050579803 * ((2 ** 8) - 1);
        twiddles_storage[223].sin = -0.9795704091561344 * ((2 ** 8) - 1);

        twiddles_storage[224].cos = 0.19508716971781054 * ((2 ** 8) - 1);
        twiddles_storage[224].sin = -0.9807859074290852 * ((2 ** 8) - 1);

        twiddles_storage[225].cos = 0.18906549397379568 * ((2 ** 8) - 1);
        twiddles_storage[225].sin = -0.9819644794942659 * ((2 ** 8) - 1);

        twiddles_storage[226].cos = 0.18303669998750233 * ((2 ** 8) - 1);
        twiddles_storage[226].sin = -0.9831060809788967 * ((2 ** 8) - 1);

        twiddles_storage[227].cos = 0.17700101474067767 * ((2 ** 8) - 1);
        twiddles_storage[227].sin = -0.984210668902126 * ((2 ** 8) - 1);

        twiddles_storage[228].cos = 0.17095866547452285 * ((2 ** 8) - 1);
        twiddles_storage[228].sin = -0.9852782016766484 * ((2 ** 8) - 1);

        twiddles_storage[229].cos = 0.16490987968113677 * ((2 ** 8) - 1);
        twiddles_storage[229].sin = -0.9863086391102701 * ((2 ** 8) - 1);

        twiddles_storage[230].cos = 0.15885488509495038 * ((2 ** 8) - 1);
        twiddles_storage[230].sin = -0.9873019424074229 * ((2 ** 8) - 1);

        twiddles_storage[231].cos = 0.152793909684154 * ((2 ** 8) - 1);
        twiddles_storage[231].sin = -0.9882580741706241 * ((2 ** 8) - 1);

        twiddles_storage[232].cos = 0.1467271816421135 * ((2 ** 8) - 1);
        twiddles_storage[232].sin = -0.9891769984018847 * ((2 ** 8) - 1);

        twiddles_storage[233].cos = 0.14065492937877863 * ((2 ** 8) - 1);
        twiddles_storage[233].sin = -0.9900586805040653 * ((2 ** 8) - 1);

        twiddles_storage[234].cos = 0.13457738151208448 * ((2 ** 8) - 1);
        twiddles_storage[234].sin = -0.9909030872821776 * ((2 ** 8) - 1);

        twiddles_storage[235].cos = 0.1284947668593435 * ((2 ** 8) - 1);
        twiddles_storage[235].sin = -0.9917101869446351 * ((2 ** 8) - 1);

        twiddles_storage[236].cos = 0.12240731442863007 * ((2 ** 8) - 1);
        twiddles_storage[236].sin = -0.9924799491044494 * ((2 ** 8) - 1);

        twiddles_storage[237].cos = 0.11631525341015966 * ((2 ** 8) - 1);
        twiddles_storage[237].sin = -0.9932123447803749 * ((2 ** 8) - 1);

        twiddles_storage[238].cos = 0.11021881316765932 * ((2 ** 8) - 1);
        twiddles_storage[238].sin = -0.9939073463979993 * ((2 ** 8) - 1);

        twiddles_storage[239].cos = 0.10411822322973145 * ((2 ** 8) - 1);
        twiddles_storage[239].sin = -0.9945649277907822 * ((2 ** 8) - 1);

        twiddles_storage[240].cos = 0.0980137132812136 * ((2 ** 8) - 1);
        twiddles_storage[240].sin = -0.99518506420104 * ((2 ** 8) - 1);

        twiddles_storage[241].cos = 0.09190551315453012 * ((2 ** 8) - 1);
        twiddles_storage[241].sin = -0.9957677322808781 * ((2 ** 8) - 1);

        twiddles_storage[242].cos = 0.08579385282103855 * ((2 ** 8) - 1);
        twiddles_storage[242].sin = -0.9963129100930701 * ((2 ** 8) - 1);

        twiddles_storage[243].cos = 0.07967896238237245 * ((2 ** 8) - 1);
        twiddles_storage[243].sin = -0.9968205771118835 * ((2 ** 8) - 1);

        twiddles_storage[244].cos = 0.07356107206177764 * ((2 ** 8) - 1);
        twiddles_storage[244].sin = -0.9972907142238525 * ((2 ** 8) - 1);

        twiddles_storage[245].cos = 0.06744041219544365 * ((2 ** 8) - 1);
        twiddles_storage[245].sin = -0.997723303728498 * ((2 ** 8) - 1);

        twiddles_storage[246].cos = 0.06131721322383322 * ((2 ** 8) - 1);
        twiddles_storage[246].sin = -0.9981183293389932 * ((2 ** 8) - 1);

        twiddles_storage[247].cos = 0.05519170568300451 * ((2 ** 8) - 1);
        twiddles_storage[247].sin = -0.9984757761827778 * ((2 ** 8) - 1);

        twiddles_storage[248].cos = 0.04906412019593309 * ((2 ** 8) - 1);
        twiddles_storage[248].sin = -0.9987956308021171 * ((2 ** 8) - 1);

        twiddles_storage[249].cos = 0.042934687463828405 * ((2 ** 8) - 1);
        twiddles_storage[249].sin = -0.9990778811546092 * ((2 ** 8) - 1);

        twiddles_storage[250].cos = 0.03680363825744728 * ((2 ** 8) - 1);
        twiddles_storage[250].sin = -0.9993225166136381 * ((2 ** 8) - 1);

        twiddles_storage[251].cos = 0.030671203408406834 * ((2 ** 8) - 1);
        twiddles_storage[251].sin = -0.999529527968774 * ((2 ** 8) - 1);

        twiddles_storage[252].cos = 0.024537613800493095 * ((2 ** 8) - 1);
        twiddles_storage[252].sin = -0.9996989074261199 * ((2 ** 8) - 1);

        twiddles_storage[253].cos = 0.01840310036096765 * ((2 ** 8) - 1);
        twiddles_storage[253].sin = -0.9998306486086052 * ((2 ** 8) - 1);

        twiddles_storage[254].cos = 0.012267894051874647 * ((2 ** 8) - 1);
        twiddles_storage[254].sin = -0.9999247465562255 * ((2 ** 8) - 1);

        twiddles_storage[255].cos = 0.006132225861344512 * ((2 ** 8) - 1);
        twiddles_storage[255].sin = -0.99998119772623 * ((2 ** 8) - 1);

        twiddles_storage[256].cos = -3.673205103346574e-06 * ((2 ** 8) - 1);
        twiddles_storage[256].sin = -0.9999999999932537 * ((2 ** 8) - 1);

        twiddles_storage[257].cos = -0.0061395721332564625 * ((2 ** 8) - 1);
        twiddles_storage[257].sin = -0.9999811526493989 * ((2 ** 8) - 1);

        twiddles_storage[258].cos = -0.012275239908907576 * ((2 ** 8) - 1);
        twiddles_storage[258].sin = -0.9999246564042606 * ((2 ** 8) - 1);

        twiddles_storage[259].cos = -0.018410445526552896 * ((2 ** 8) - 1);
        twiddles_storage[259].sin = -0.9998305133849006 * ((2 ** 8) - 1);

        twiddles_storage[260].cos = -0.024544957998088035 * ((2 ** 8) - 1);
        twiddles_storage[260].sin = -0.9996987271357667 * ((2 ** 8) - 1);

        twiddles_storage[261].cos = -0.030678546361505285 * ((2 ** 8) - 1);
        twiddles_storage[261].sin = -0.99952930261856 * ((2 ** 8) - 1);

        twiddles_storage[262].cos = -0.03681097968958992 * ((2 ** 8) - 1);
        twiddles_storage[262].sin = -0.9993222462120478 * ((2 ** 8) - 1);

        twiddles_storage[263].cos = -0.04294202709861317 * ((2 ** 8) - 1);
        twiddles_storage[263].sin = -0.9990775657118229 * ((2 ** 8) - 1);

        twiddles_storage[264].cos = -0.04907145775702558 * ((2 ** 8) - 1);
        twiddles_storage[264].sin = -0.9987952703300114 * ((2 ** 8) - 1);

        twiddles_storage[265].cos = -0.055199040894148406 * ((2 ** 8) - 1);
        twiddles_storage[265].sin = -0.9984753706949241 * ((2 ** 8) - 1);

        twiddles_storage[266].cos = -0.061324545808860674 * ((2 ** 8) - 1);
        twiddles_storage[266].sin = -0.9981178788506581 * ((2 ** 8) - 1);

        twiddles_storage[267].cos = -0.0674477418782857 * ((2 ** 8) - 1);
        twiddles_storage[267].sin = -0.9977228082566421 * ((2 ** 8) - 1);

        twiddles_storage[268].cos = -0.07356839856647457 * ((2 ** 8) - 1);
        twiddles_storage[268].sin = -0.9972901737871301 * ((2 ** 8) - 1);

        twiddles_storage[269].cos = -0.0796862854330842 * ((2 ** 8) - 1);
        twiddles_storage[269].sin = -0.996819991730642 * ((2 ** 8) - 1);

        twiddles_storage[270].cos = -0.08580117214205513 * ((2 ** 8) - 1);
        twiddles_storage[270].sin = -0.9963122797893487 * ((2 ** 8) - 1);

        twiddles_storage[271].cos = -0.09191282847028194 * ((2 ** 8) - 1);
        twiddles_storage[271].sin = -0.9957670570784075 * ((2 ** 8) - 1);

        twiddles_storage[272].cos = -0.09802102431628186 * ((2 ** 8) - 1);
        twiddles_storage[272].sin = -0.9951843441252414 * ((2 ** 8) - 1);

        twiddles_storage[273].cos = -0.10412552970885854 * ((2 ** 8) - 1);
        twiddles_storage[273].sin = -0.9945641628687661 * ((2 ** 8) - 1);

        twiddles_storage[274].cos = -0.11022611481575911 * ((2 ** 8) - 1);
        twiddles_storage[274].sin = -0.9939065366585649 * ((2 ** 8) - 1);

        twiddles_storage[275].cos = -0.11632254995232798 * ((2 ** 8) - 1);
        twiddles_storage[275].sin = -0.9932114902540083 * ((2 ** 8) - 1);

        twiddles_storage[276].cos = -0.1224146055901549 * ((2 ** 8) - 1);
        twiddles_storage[276].sin = -0.9924790498233234 * ((2 ** 8) - 1);

        twiddles_storage[277].cos = -0.12850205236571546 * ((2 ** 8) - 1);
        twiddles_storage[277].sin = -0.9917092429426071 * ((2 ** 8) - 1);

        twiddles_storage[278].cos = -0.13458466108900713 * ((2 ** 8) - 1);
        twiddles_storage[278].sin = -0.9909020985947891 * ((2 ** 8) - 1);

        twiddles_storage[279].cos = -0.14066220275217872 * ((2 ** 8) - 1);
        twiddles_storage[279].sin = -0.9900576471685398 * ((2 ** 8) - 1);

        twiddles_storage[280].cos = -0.14673444853815135 * ((2 ** 8) - 1);
        twiddles_storage[280].sin = -0.9891759204571271 * ((2 ** 8) - 1);

        twiddles_storage[281].cos = -0.15280116982923375 * ((2 ** 8) - 1);
        twiddles_storage[281].sin = -0.9882569516572184 * ((2 ** 8) - 1);

        twiddles_storage[282].cos = -0.15886213821573045 * ((2 ** 8) - 1);
        twiddles_storage[282].sin = -0.9873007753676314 * ((2 ** 8) - 1);

        twiddles_storage[283].cos = -0.16491712550453996 * ((2 ** 8) - 1);
        twiddles_storage[283].sin = -0.9863074275880314 * ((2 ** 8) - 1);

        twiddles_storage[284].cos = -0.17096590372774673 * ((2 ** 8) - 1);
        twiddles_storage[284].sin = -0.9852769457175758 * ((2 ** 8) - 1);

        twiddles_storage[285].cos = -0.17700824515120483 * ((2 ** 8) - 1);
        twiddles_storage[285].sin = -0.9842093685535059 * ((2 ** 8) - 1);

        twiddles_storage[286].cos = -0.18304392228311062 * ((2 ** 8) - 1);
        twiddles_storage[286].sin = -0.9831047362896868 * ((2 ** 8) - 1);

        twiddles_storage[287].cos = -0.1890727078825685 * ((2 ** 8) - 1);
        twiddles_storage[287].sin = -0.9819630905150931 * ((2 ** 8) - 1);

        twiddles_storage[288].cos = -0.195094374968147 * ((2 ** 8) - 1);
        twiddles_storage[288].sin = -0.980784474212244 * ((2 ** 8) - 1);

        twiddles_storage[289].cos = -0.2011086968264233 * ((2 ** 8) - 1);
        twiddles_storage[289].sin = -0.9795689317555849 * ((2 ** 8) - 1);

        twiddles_storage[290].cos = -0.20711544702051948 * ((2 ** 8) - 1);
        twiddles_storage[290].sin = -0.9783165089098161 * ((2 ** 8) - 1);

        twiddles_storage[291].cos = -0.21311439939862856 * ((2 ** 8) - 1);
        twiddles_storage[291].sin = -0.9770272528281705 * ((2 ** 8) - 1);

        twiddles_storage[292].cos = -0.2191053281025274 * ((2 ** 8) - 1);
        twiddles_storage[292].sin = -0.9757012120506379 * ((2 ** 8) - 1);

        twiddles_storage[293].cos = -0.22508800757608188 * ((2 ** 8) - 1);
        twiddles_storage[293].sin = -0.9743384365021375 * ((2 ** 8) - 1);

        twiddles_storage[294].cos = -0.23106221257373763 * ((2 ** 8) - 1);
        twiddles_storage[294].sin = -0.9729389774906384 * ((2 ** 8) - 1);

        twiddles_storage[295].cos = -0.23702771816900095 * ((2 ** 8) - 1);
        twiddles_storage[295].sin = -0.9715028877052279 * ((2 ** 8) - 1);

        twiddles_storage[296].cos = -0.24298429976290792 * ((2 ** 8) - 1);
        twiddles_storage[296].sin = -0.9700302212141276 * ((2 ** 8) - 1);

        twiddles_storage[297].cos = -0.24893173309247912 * ((2 ** 8) - 1);
        twiddles_storage[297].sin = -0.9685210334626578 * ((2 ** 8) - 1);

        twiddles_storage[298].cos = -0.2548697942391638 * ((2 ** 8) - 1);
        twiddles_storage[298].sin = -0.9669753812711502 * ((2 ** 8) - 1);

        twiddles_storage[299].cos = -0.26079825963727077 * ((2 ** 8) - 1);
        twiddles_storage[299].sin = -0.9653933228328082 * ((2 ** 8) - 1);

        twiddles_storage[300].cos = -0.2667169060823845 * ((2 ** 8) - 1);
        twiddles_storage[300].sin = -0.9637749177115166 * ((2 ** 8) - 1);

        twiddles_storage[301].cos = -0.27262551073976926 * ((2 ** 8) - 1);
        twiddles_storage[301].sin = -0.9621202268395982 * ((2 ** 8) - 1);

        twiddles_storage[302].cos = -0.2785238511527592 * ((2 ** 8) - 1);
        twiddles_storage[302].sin = -0.9604293125155207 * ((2 ** 8) - 1);

        twiddles_storage[303].cos = -0.28441170525113274 * ((2 ** 8) - 1);
        twiddles_storage[303].sin = -0.9587022384015502 * ((2 ** 8) - 1);

        twiddles_storage[304].cos = -0.29028885135947397 * ((2 ** 8) - 1);
        twiddles_storage[304].sin = -0.9569390695213553 * ((2 ** 8) - 1);

        twiddles_storage[305].cos = -0.29615506820551923 * ((2 ** 8) - 1);
        twiddles_storage[305].sin = -0.955139872257558 * ((2 ** 8) - 1);

        twiddles_storage[306].cos = -0.3020101349284868 * ((2 ** 8) - 1);
        twiddles_storage[306].sin = -0.9533047143492354 * ((2 ** 8) - 1);

        twiddles_storage[307].cos = -0.30785383108739256 * ((2 ** 8) - 1);
        twiddles_storage[307].sin = -0.9514336648893685 * ((2 ** 8) - 1);

        twiddles_storage[308].cos = -0.3136859366693505 * ((2 ** 8) - 1);
        twiddles_storage[308].sin = -0.9495267943222414 * ((2 ** 8) - 1);

        twiddles_storage[309].cos = -0.3195062320978547 * ((2 ** 8) - 1);
        twiddles_storage[309].sin = -0.9475841744407891 * ((2 ** 8) - 1);

        twiddles_storage[310].cos = -0.32531449824104686 * ((2 ** 8) - 1);
        twiddles_storage[310].sin = -0.9456058783838941 * ((2 ** 8) - 1);

        twiddles_storage[311].cos = -0.3311105164199672 * ((2 ** 8) - 1);
        twiddles_storage[311].sin = -0.9435919806336331 * ((2 ** 8) - 1);

        twiddles_storage[312].cos = -0.3368940684167864 * ((2 ** 8) - 1);
        twiddles_storage[312].sin = -0.9415425570124728 * ((2 ** 8) - 1);

        twiddles_storage[313].cos = -0.34266493648302204 * ((2 ** 8) - 1);
        twiddles_storage[313].sin = -0.9394576846804152 * ((2 ** 8) - 1);

        twiddles_storage[314].cos = -0.3484229033477375 * ((2 ** 8) - 1);
        twiddles_storage[314].sin = -0.9373374421320921 * ((2 ** 8) - 1);

        twiddles_storage[315].cos = -0.35416775222572044 * ((2 ** 8) - 1);
        twiddles_storage[315].sin = -0.9351819091938106 * ((2 ** 8) - 1);

        twiddles_storage[316].cos = -0.35989926682564644 * ((2 ** 8) - 1);
        twiddles_storage[316].sin = -0.932991167020547 * ((2 ** 8) - 1);

        twiddles_storage[317].cos = -0.3656172313582209 * ((2 ** 8) - 1);
        twiddles_storage[317].sin = -0.9307652980928915 * ((2 ** 8) - 1);

        twiddles_storage[318].cos = -0.37132143054430383 * ((2 ** 8) - 1);
        twiddles_storage[318].sin = -0.9285043862139434 * ((2 ** 8) - 1);

        twiddles_storage[319].cos = -0.37701164962301603 * ((2 ** 8) - 1);
        twiddles_storage[319].sin = -0.9262085165061549 * ((2 ** 8) - 1);

        twiddles_storage[320].cos = -0.3826876743598231 * ((2 ** 8) - 1);
        twiddles_storage[320].sin = -0.9238777754081272 * ((2 ** 8) - 1);

        twiddles_storage[321].cos = -0.38834929105460214 * ((2 ** 8) - 1);
        twiddles_storage[321].sin = -0.9215122506713559 * ((2 ** 8) - 1);

        twiddles_storage[322].cos = -0.39399628654968816 * ((2 ** 8) - 1);
        twiddles_storage[322].sin = -0.9191120313569265 * ((2 ** 8) - 1);

        twiddles_storage[323].cos = -0.39962844823789784 * ((2 ** 8) - 1);
        twiddles_storage[323].sin = -0.9166772078321626 * ((2 ** 8) - 1);

        twiddles_storage[324].cos = -0.40524556407053497 * ((2 ** 8) - 1);
        twiddles_storage[324].sin = -0.9142078717672223 * ((2 ** 8) - 1);

        twiddles_storage[325].cos = -0.4108474225653747 * ((2 ** 8) - 1);
        twiddles_storage[325].sin = -0.9117041161316474 * ((2 ** 8) - 1);

        twiddles_storage[326].cos = -0.41643381281462405 * ((2 ** 8) - 1);
        twiddles_storage[326].sin = -0.9091660351908636 * ((2 ** 8) - 1);

        twiddles_storage[327].cos = -0.4220045244928645 * ((2 ** 8) - 1);
        twiddles_storage[327].sin = -0.9065937245026304 * ((2 ** 8) - 1);

        twiddles_storage[328].cos = -0.42755934786496835 * ((2 ** 8) - 1);
        twiddles_storage[328].sin = -0.9039872809134446 * ((2 ** 8) - 1);

        twiddles_storage[329].cos = -0.4330980737939974 * ((2 ** 8) - 1);
        twiddles_storage[329].sin = -0.901346802554893 * ((2 ** 8) - 1);

        twiddles_storage[330].cos = -0.4386204937490761 * ((2 ** 8) - 1);
        twiddles_storage[330].sin = -0.898672388839958 * ((2 ** 8) - 1);

        twiddles_storage[331].cos = -0.44412639981324126 * ((2 ** 8) - 1);
        twiddles_storage[331].sin = -0.8959641404592759 * ((2 ** 8) - 1);

        twiddles_storage[332].cos = -0.4496155846912724 * ((2 ** 8) - 1);
        twiddles_storage[332].sin = -0.893222159377344 * ((2 ** 8) - 1);

        twiddles_storage[333].cos = -0.4550878417174952 * ((2 ** 8) - 1);
        twiddles_storage[333].sin = -0.8904465488286829 * ((2 ** 8) - 1);

        twiddles_storage[334].cos = -0.4605429648635613 * ((2 ** 8) - 1);
        twiddles_storage[334].sin = -0.8876374133139503 * ((2 ** 8) - 1);

        twiddles_storage[335].cos = -0.46598074874620726 * ((2 ** 8) - 1);
        twiddles_storage[335].sin = -0.8847948585960047 * ((2 ** 8) - 1);

        twiddles_storage[336].cos = -0.47140098863498625 * ((2 ** 8) - 1);
        twiddles_storage[336].sin = -0.8819189916959252 * ((2 ** 8) - 1);

        twiddles_storage[337].cos = -0.47680348045997484 * ((2 ** 8) - 1);
        twiddles_storage[337].sin = -0.879009920888982 * ((2 ** 8) - 1);

        twiddles_storage[338].cos = -0.4821880208194584 * ((2 ** 8) - 1);
        twiddles_storage[338].sin = -0.8760677557005585 * ((2 ** 8) - 1);

        twiddles_storage[339].cos = -0.48755440698758806 * ((2 ** 8) - 1);
        twiddles_storage[339].sin = -0.8730926069020293 * ((2 ** 8) - 1);

        twiddles_storage[340].cos = -0.49290243692201197 * ((2 ** 8) - 1);
        twiddles_storage[340].sin = -0.870084586506589 * ((2 ** 8) - 1);

        twiddles_storage[341].cos = -0.4982319092714845 * ((2 ** 8) - 1);
        twiddles_storage[341].sin = -0.8670438077650352 * ((2 ** 8) - 1);

        twiddles_storage[342].cos = -0.5035426233834459 * ((2 ** 8) - 1);
        twiddles_storage[342].sin = -0.8639703851615038 * ((2 ** 8) - 1);

        twiddles_storage[343].cos = -0.5088343793115756 * ((2 ** 8) - 1);
        twiddles_storage[343].sin = -0.8608644344091604 * ((2 ** 8) - 1);

        twiddles_storage[344].cos = -0.5141069778233224 * ((2 ** 8) - 1);
        twiddles_storage[344].sin = -0.8577260724458421 * ((2 ** 8) - 1);

        twiddles_storage[345].cos = -0.5193602204074045 * ((2 ** 8) - 1);
        twiddles_storage[345].sin = -0.8545554174296552 * ((2 ** 8) - 1);

        twiddles_storage[346].cos = -0.5245939092812818 * ((2 ** 8) - 1);
        twiddles_storage[346].sin = -0.8513525887345279 * ((2 ** 8) - 1);

        twiddles_storage[347].cos = -0.5298078473986053 * ((2 ** 8) - 1);
        twiddles_storage[347].sin = -0.8481177069457141 * ((2 ** 8) - 1);

        twiddles_storage[348].cos = -0.535001838456634 * ((2 ** 8) - 1);
        twiddles_storage[348].sin = -0.844850893855254 * ((2 ** 8) - 1);

        twiddles_storage[349].cos = -0.5401756869036249 * ((2 ** 8) - 1);
        twiddles_storage[349].sin = -0.8415522724573898 * ((2 ** 8) - 1);

        twiddles_storage[350].cos = -0.5453291979461978 * ((2 ** 8) - 1);
        twiddles_storage[350].sin = -0.8382219669439335 * ((2 ** 8) - 1);

        twiddles_storage[351].cos = -0.550462177556667 * ((2 ** 8) - 1);
        twiddles_storage[351].sin = -0.8348601026995914 * ((2 ** 8) - 1);

        twiddles_storage[352].cos = -0.5555744324803481 * ((2 ** 8) - 1);
        twiddles_storage[352].sin = -0.8314668062972442 * ((2 ** 8) - 1);

        twiddles_storage[353].cos = -0.5606657702428317 * ((2 ** 8) - 1);
        twiddles_storage[353].sin = -0.8280422054931815 * ((2 ** 8) - 1);

        twiddles_storage[354].cos = -0.5657359991572325 * ((2 ** 8) - 1);
        twiddles_storage[354].sin = -0.8245864292222908 * ((2 ** 8) - 1);

        twiddles_storage[355].cos = -0.5707849283314053 * ((2 ** 8) - 1);
        twiddles_storage[355].sin = -0.8210996075932034 * ((2 ** 8) - 1);

        twiddles_storage[356].cos = -0.5758123676751303 * ((2 ** 8) - 1);
        twiddles_storage[356].sin = -0.8175818718833977 * ((2 ** 8) - 1);

        twiddles_storage[357].cos = -0.5808181279072734 * ((2 ** 8) - 1);
        twiddles_storage[357].sin = -0.8140333545342539 * ((2 ** 8) - 1);

        twiddles_storage[358].cos = -0.5858020205629095 * ((2 ** 8) - 1);
        twiddles_storage[358].sin = -0.8104541891460693 * ((2 ** 8) - 1);

        twiddles_storage[359].cos = -0.5907638580004191 * ((2 ** 8) - 1);
        twiddles_storage[359].sin = -0.8068445104730283 * ((2 ** 8) - 1);

        twiddles_storage[360].cos = -0.5957034534085537 * ((2 ** 8) - 1);
        twiddles_storage[360].sin = -0.8032044544181283 * ((2 ** 8) - 1);

        twiddles_storage[361].cos = -0.6006206208134686 * ((2 ** 8) - 1);
        twiddles_storage[361].sin = -0.7995341580280629 * ((2 ** 8) - 1);

        twiddles_storage[362].cos = -0.6055151750857236 * ((2 ** 8) - 1);
        twiddles_storage[362].sin = -0.7958337594880638 * ((2 ** 8) - 1);

        twiddles_storage[363].cos = -0.6103869319472555 * ((2 ** 8) - 1);
        twiddles_storage[363].sin = -0.7921033981166957 * ((2 ** 8) - 1);

        twiddles_storage[364].cos = -0.6152357079783143 * ((2 ** 8) - 1);
        twiddles_storage[364].sin = -0.7883432143606124 * ((2 ** 8) - 1);

        twiddles_storage[365].cos = -0.6200613206243686 * ((2 ** 8) - 1);
        twiddles_storage[365].sin = -0.7845533497892696 * ((2 ** 8) - 1);

        twiddles_storage[366].cos = -0.6248635882029804 * ((2 ** 8) - 1);
        twiddles_storage[366].sin = -0.7807339470895935 * ((2 ** 8) - 1);

        twiddles_storage[367].cos = -0.6296423299106442 * ((2 ** 8) - 1);
        twiddles_storage[367].sin = -0.7768851500606093 * ((2 ** 8) - 1);

        twiddles_storage[368].cos = -0.6343973658295937 * ((2 ** 8) - 1);
        twiddles_storage[368].sin = -0.773007103608028 * ((2 ** 8) - 1);

        twiddles_storage[369].cos = -0.6391285169345772 * ((2 ** 8) - 1);
        twiddles_storage[369].sin = -0.7690999537387894 * ((2 ** 8) - 1);

        twiddles_storage[370].cos = -0.6438356050995968 * ((2 ** 8) - 1);
        twiddles_storage[370].sin = -0.7651638475555651 * ((2 ** 8) - 1);

        twiddles_storage[371].cos = -0.6485184531046141 * ((2 ** 8) - 1);
        twiddles_storage[371].sin = -0.7611989332512221 * ((2 ** 8) - 1);

        twiddles_storage[372].cos = -0.6531768846422242 * ((2 ** 8) - 1);
        twiddles_storage[372].sin = -0.7572053601032408 * ((2 ** 8) - 1);

        twiddles_storage[373].cos = -0.6578107243242928 * ((2 ** 8) - 1);
        twiddles_storage[373].sin = -0.7531832784680959 * ((2 ** 8) - 1);

        twiddles_storage[374].cos = -0.6624197976885583 * ((2 ** 8) - 1);
        twiddles_storage[374].sin = -0.7491328397755964 * ((2 ** 8) - 1);

        twiddles_storage[375].cos = -0.6670039312052024 * ((2 ** 8) - 1);
        twiddles_storage[375].sin = -0.7450541965231829 * ((2 ** 8) - 1);

        twiddles_storage[376].cos = -0.6715629522833823 * ((2 ** 8) - 1);
        twiddles_storage[376].sin = -0.7409475022701862 * ((2 ** 8) - 1);

        twiddles_storage[377].cos = -0.6760966892777276 * ((2 ** 8) - 1);
        twiddles_storage[377].sin = -0.7368129116320478 * ((2 ** 8) - 1);

        twiddles_storage[378].cos = -0.6806049714948051 * ((2 ** 8) - 1);
        twiddles_storage[378].sin = -0.7326505802744958 * ((2 ** 8) - 1);

        twiddles_storage[379].cos = -0.685087629199544 * ((2 ** 8) - 1);
        twiddles_storage[379].sin = -0.728460664907686 * ((2 ** 8) - 1);

        twiddles_storage[380].cos = -0.6895444936216253 * ((2 ** 8) - 1);
        twiddles_storage[380].sin = -0.7242433232803022 * ((2 ** 8) - 1);

        twiddles_storage[381].cos = -0.6939753969618381 * ((2 ** 8) - 1);
        twiddles_storage[381].sin = -0.7199987141736153 * ((2 ** 8) - 1);

        twiddles_storage[382].cos = -0.698380172398396 * ((2 ** 8) - 1);
        twiddles_storage[382].sin = -0.715726997395506 * ((2 ** 8) - 1);

        twiddles_storage[383].cos = -0.7027586540932172 * ((2 ** 8) - 1);
        twiddles_storage[383].sin = -0.7114283337744497 * ((2 ** 8) - 1);

        twiddles_storage[384].cos = -0.7071106771981701 * ((2 ** 8) - 1);
        twiddles_storage[384].sin = -0.7071028851534585 * ((2 ** 8) - 1);

        twiddles_storage[385].cos = -0.7114360778612786 * ((2 ** 8) - 1);
        twiddles_storage[385].sin = -0.7027508143839897 * ((2 ** 8) - 1);

        twiddles_storage[386].cos = -0.71573469323289 * ((2 ** 8) - 1);
        twiddles_storage[386].sin = -0.6983722853198149 * ((2 ** 8) - 1);

        twiddles_storage[387].cos = -0.7200063614718086 * ((2 ** 8) - 1);
        twiddles_storage[387].sin = -0.693967462810849 * ((2 ** 8) - 1);

        twiddles_storage[388].cos = -0.7242509217513879 * ((2 ** 8) - 1);
        twiddles_storage[388].sin = -0.6895365126969455 * ((2 ** 8) - 1);

        twiddles_storage[389].cos = -0.7284682142655843 * ((2 ** 8) - 1);
        twiddles_storage[389].sin = -0.6850796018016525 * ((2 ** 8) - 1);

        twiddles_storage[390].cos = -0.7326580802349759 * ((2 ** 8) - 1);
        twiddles_storage[390].sin = -0.6805968979259306 * ((2 ** 8) - 1);

        twiddles_storage[391].cos = -0.7368203619127397 * ((2 ** 8) - 1);
        twiddles_storage[391].sin = -0.6760885698418361 * ((2 ** 8) - 1);

        twiddles_storage[392].cos = -0.7409549025905896 * ((2 ** 8) - 1);
        twiddles_storage[392].sin = -0.6715547872861677 * ((2 ** 8) - 1);

        twiddles_storage[393].cos = -0.7450615466046782 * ((2 ** 8) - 1);
        twiddles_storage[393].sin = -0.6669957209540741 * ((2 ** 8) - 1);

        twiddles_storage[394].cos = -0.7491401393414564 * ((2 ** 8) - 1);
        twiddles_storage[394].sin = -0.6624115424926285 * ((2 ** 8) - 1);

        twiddles_storage[395].cos = -0.7531905272434946 * ((2 ** 8) - 1);
        twiddles_storage[395].sin = -0.6578024244943665 * ((2 ** 8) - 1);

        twiddles_storage[396].cos = -0.7572125578152642 * ((2 ** 8) - 1);
        twiddles_storage[396].sin = -0.6531685404907872 * ((2 ** 8) - 1);

        twiddles_storage[397].cos = -0.7612060796288795 * ((2 ** 8) - 1);
        twiddles_storage[397].sin = -0.6485100649458201 * ((2 ** 8) - 1);

        twiddles_storage[398].cos = -0.7651709423297985 * ((2 ** 8) - 1);
        twiddles_storage[398].sin = -0.6438271732492564 * ((2 ** 8) - 1);

        twiddles_storage[399].cos = -0.7691069966424827 * ((2 ** 8) - 1);
        twiddles_storage[399].sin = -0.639120041710147 * ((2 ** 8) - 1);

        twiddles_storage[400].cos = -0.7730140943760191 * ((2 ** 8) - 1);
        twiddles_storage[400].sin = -0.6343888475501623 * ((2 ** 8) - 1);

        twiddles_storage[401].cos = -0.7768920884296986 * ((2 ** 8) - 1);
        twiddles_storage[401].sin = -0.6296337688969211 * ((2 ** 8) - 1);

        twiddles_storage[402].cos = -0.7807408327985536 * ((2 ** 8) - 1);
        twiddles_storage[402].sin = -0.6248549847772851 * ((2 ** 8) - 1);

        twiddles_storage[403].cos = -0.7845601825788563 * ((2 ** 8) - 1);
        twiddles_storage[403].sin = -0.6200526751106165 * ((2 ** 8) - 1);

        twiddles_storage[404].cos = -0.7883499939735743 * ((2 ** 8) - 1);
        twiddles_storage[404].sin = -0.6152270207020051 * ((2 ** 8) - 1);

        twiddles_storage[405].cos = -0.7921101242977825 * ((2 ** 8) - 1);
        twiddles_storage[405].sin = -0.6103782032354625 * ((2 ** 8) - 1);

        twiddles_storage[406].cos = -0.7958404319840376 * ((2 ** 8) - 1);
        twiddles_storage[406].sin = -0.6055064052670792 * ((2 ** 8) - 1);

        twiddles_storage[407].cos = -0.7995407765877072 * ((2 ** 8) - 1);
        twiddles_storage[407].sin = -0.6006118102181526 * ((2 ** 8) - 1);

        twiddles_storage[408].cos = -0.8032110187922561 * ((2 ** 8) - 1);
        twiddles_storage[408].sin = -0.5956946023682823 * ((2 ** 8) - 1);

        twiddles_storage[409].cos = -0.806851020414494 * ((2 ** 8) - 1);
        twiddles_storage[409].sin = -0.5907549668484302 * ((2 ** 8) - 1);

        twiddles_storage[410].cos = -0.8104606444097762 * ((2 ** 8) - 1);
        twiddles_storage[410].sin = -0.5857930896339512 * ((2 ** 8) - 1);

        twiddles_storage[411].cos = -0.8140397548771635 * ((2 ** 8) - 1);
        twiddles_storage[411].sin = -0.5808091575375922 * ((2 ** 8) - 1);

        twiddles_storage[412].cos = -0.8175882170645397 * ((2 ** 8) - 1);
        twiddles_storage[412].sin = -0.5758033582024571 * ((2 ** 8) - 1);

        twiddles_storage[413].cos = -0.8211058973736846 * ((2 ** 8) - 1);
        twiddles_storage[413].sin = -0.5707758800949425 * ((2 ** 8) - 1);

        twiddles_storage[414].cos = -0.8245926633653027 * ((2 ** 8) - 1);
        twiddles_storage[414].sin = -0.5657269124976437 * ((2 ** 8) - 1);

        twiddles_storage[415].cos = -0.8280483837640115 * ((2 ** 8) - 1);
        twiddles_storage[415].sin = -0.5606566455022256 * ((2 ** 8) - 1);

        twiddles_storage[416].cos = -0.831472928463283 * ((2 ** 8) - 1);
        twiddles_storage[416].sin = -0.5555652700022674 * ((2 ** 8) - 1);

        twiddles_storage[417].cos = -0.8348661685303412 * ((2 ** 8) - 1);
        twiddles_storage[417].sin = -0.550452977686076 * ((2 ** 8) - 1);

        twiddles_storage[418].cos = -0.8382279762110184 * ((2 ** 8) - 1);
        twiddles_storage[418].sin = -0.5453199610294678 * ((2 ** 8) - 1);

        twiddles_storage[419].cos = -0.8415582249345638 * ((2 ** 8) - 1);
        twiddles_storage[419].sin = -0.5401664132885219 * ((2 ** 8) - 1);

        twiddles_storage[420].cos = -0.844856789318408 * ((2 ** 8) - 1);
        twiddles_storage[420].sin = -0.5349925284923062 * ((2 ** 8) - 1);

        twiddles_storage[421].cos = -0.8481235451728861 * ((2 ** 8) - 1);
        twiddles_storage[421].sin = -0.5297985014355696 * ((2 ** 8) - 1);

        twiddles_storage[422].cos = -0.8513583695059115 * ((2 ** 8) - 1);
        twiddles_storage[422].sin = -0.5245845276714095 * ((2 ** 8) - 1);

        twiddles_storage[423].cos = -0.8545611405276063 * ((2 ** 8) - 1);
        twiddles_storage[423].sin = -0.5193508035039098 * ((2 ** 8) - 1);

        twiddles_storage[424].cos = -0.857731737654888 * ((2 ** 8) - 1);
        twiddles_storage[424].sin = -0.5140975259807485 * ((2 ** 8) - 1);

        twiddles_storage[425].cos = -0.8608700415160088 * ((2 ** 8) - 1);
        twiddles_storage[425].sin = -0.5088248928857799 * ((2 ** 8) - 1);

        twiddles_storage[426].cos = -0.8639759339550489 * ((2 ** 8) - 1);
        twiddles_storage[426].sin = -0.503533102731589 * ((2 ** 8) - 1);

        twiddles_storage[427].cos = -0.8670492980363669 * ((2 ** 8) - 1);
        twiddles_storage[427].sin = -0.4982223547520157 * ((2 ** 8) - 1);

        twiddles_storage[428].cos = -0.8700900180490013 * ((2 ** 8) - 1);
        twiddles_storage[428].sin = -0.4928928488946544 * ((2 ** 8) - 1);

        twiddles_storage[429].cos = -0.8730979795110263 * ((2 ** 8) - 1);
        twiddles_storage[429].sin = -0.4875447858133276 * ((2 ** 8) - 1);

        twiddles_storage[430].cos = -0.8760730691738636 * ((2 ** 8) - 1);
        twiddles_storage[430].sin = -0.4821783668605289 * ((2 ** 8) - 1);

        twiddles_storage[431].cos = -0.8790151750265452 * ((2 ** 8) - 1);
        twiddles_storage[431].sin = -0.47679379407984335 * ((2 ** 8) - 1);

        twiddles_storage[432].cos = -0.8819241862999303 * ((2 ** 8) - 1);
        twiddles_storage[432].sin = -0.47139127019834154 * ((2 ** 8) - 1);

        twiddles_storage[433].cos = -0.8847999934708765 * ((2 ** 8) - 1);
        twiddles_storage[433].sin = -0.46597099861894514 * ((2 ** 8) - 1);

        twiddles_storage[434].cos = -0.887642488266363 * ((2 ** 8) - 1);
        twiddles_storage[434].sin = -0.46053318341276944 * ((2 ** 8) - 1);

        twiddles_storage[435].cos = -0.8904515636675666 * ((2 ** 8) - 1);
        twiddles_storage[435].sin = -0.45507802931144187 * ((2 ** 8) - 1);

        twiddles_storage[436].cos = -0.8932271139138916 * ((2 ** 8) - 1);
        twiddles_storage[436].sin = -0.44960574169939116 * ((2 ** 8) - 1);

        twiddles_storage[437].cos = -0.8959690345069515 * ((2 ** 8) - 1);
        twiddles_storage[437].sin = -0.4441165266061162 * ((2 ** 8) - 1);

        twiddles_storage[438].cos = -0.8986772222145025 * ((2 ** 8) - 1);
        twiddles_storage[438].sin = -0.43861059069843 * ((2 ** 8) - 1);

        twiddles_storage[439].cos = -0.9013515750743314 * ((2 ** 8) - 1);
        twiddles_storage[439].sin = -0.4330881412726767 * ((2 ** 8) - 1);

        twiddles_storage[440].cos = -0.9039919923980938 * ((2 ** 8) - 1);
        twiddles_storage[440].sin = -0.4275493862469278 * ((2 ** 8) - 1);

        twiddles_storage[441].cos = -0.9065983747751047 * ((2 ** 8) - 1);
        twiddles_storage[441].sin = -0.4219945341531556 * ((2 ** 8) - 1);

        twiddles_storage[442].cos = -0.9091706240760818 * ((2 ** 8) - 1);
        twiddles_storage[442].sin = -0.4164237941293795 * ((2 ** 8) - 1);

        twiddles_storage[443].cos = -0.91170864345684 * ((2 ** 8) - 1);
        twiddles_storage[443].sin = -0.41083737591179376 * ((2 ** 8) - 1);

        twiddles_storage[444].cos = -0.9142123373619373 * ((2 ** 8) - 1);
        twiddles_storage[444].sin = -0.40523548982687 * ((2 ** 8) - 1);

        twiddles_storage[445].cos = -0.9166816115282721 * ((2 ** 8) - 1);
        twiddles_storage[445].sin = -0.3996183467834404 * ((2 ** 8) - 1);

        twiddles_storage[446].cos = -0.919116372988633 * ((2 ** 8) - 1);
        twiddles_storage[446].sin = -0.3939861582647543 * ((2 ** 8) - 1);

        twiddles_storage[447].cos = -0.9215165300751986 * ((2 ** 8) - 1);
        twiddles_storage[447].sin = -0.3883391363205175 * ((2 ** 8) - 1);

        twiddles_storage[448].cos = -0.9238819924229884 * ((2 ** 8) - 1);
        twiddles_storage[448].sin = -0.3826774935589095 * ((2 ** 8) - 1);

        twiddles_storage[449].cos = -0.9262126709732653 * ((2 ** 8) - 1);
        twiddles_storage[449].sin = -0.377001443138577 * ((2 ** 8) - 1);

        twiddles_storage[450].cos = -0.9285084779768893 * ((2 ** 8) - 1);
        twiddles_storage[450].sin = -0.37131119876060914 * ((2 ** 8) - 1);

        twiddles_storage[451].cos = -0.9307693269976194 * ((2 ** 8) - 1);
        twiddles_storage[451].sin = -0.36560697466049336 * ((2 ** 8) - 1);

        twiddles_storage[452].cos = -0.9329951329153702 * ((2 ** 8) - 1);
        twiddles_storage[452].sin = -0.359888985600047 * ((2 ** 8) - 1);

        twiddles_storage[453].cos = -0.9351858119294149 * ((2 ** 8) - 1);
        twiddles_storage[453].sin = -0.3541574468593328 * ((2 ** 8) - 1);

        twiddles_storage[454].cos = -0.9373412815615408 * ((2 ** 8) - 1);
        twiddles_storage[454].sin = -0.34841257422855487 * ((2 ** 8) - 1);

        twiddles_storage[455].cos = -0.9394614606591553 * ((2 ** 8) - 1);
        twiddles_storage[455].sin = -0.342654583999932 * ((2 ** 8) - 1);

        twiddles_storage[456].cos = -0.9415462693983404 * ((2 ** 8) - 1);
        twiddles_storage[456].sin = -0.33688369295955517 * ((2 ** 8) - 1);

        twiddles_storage[457].cos = -0.943595629286858 * ((2 ** 8) - 1);
        twiddles_storage[457].sin = -0.3311001183792274 * ((2 ** 8) - 1);

        twiddles_storage[458].cos = -0.945609463167106 * ((2 ** 8) - 1);
        twiddles_storage[458].sin = -0.32530407800828076 * ((2 ** 8) - 1);

        twiddles_storage[459].cos = -0.9475876952190225 * ((2 ** 8) - 1);
        twiddles_storage[459].sin = -0.31949579006537937 * ((2 ** 8) - 1);

        twiddles_storage[460].cos = -0.9495302509629402 * ((2 ** 8) - 1);
        twiddles_storage[460].sin = -0.313675473230305 * ((2 ** 8) - 1);

        twiddles_storage[461].cos = -0.9514370572623915 * ((2 ** 8) - 1);
        twiddles_storage[461].sin = -0.3078433466357212 * ((2 ** 8) - 1);

        twiddles_storage[462].cos = -0.9533080423268612 * ((2 ** 8) - 1);
        twiddles_storage[462].sin = -0.30199962985892453 * ((2 ** 8) - 1);

        twiddles_storage[463].cos = -0.9551431357144895 * ((2 ** 8) - 1);
        twiddles_storage[463].sin = -0.29614454291357856 * ((2 ** 8) - 1);

        twiddles_storage[464].cos = -0.9569422683347245 * ((2 ** 8) - 1);
        twiddles_storage[464].sin = -0.2902783062414279 * ((2 ** 8) - 1);

        twiddles_storage[465].cos = -0.9587053724509232 * ((2 ** 8) - 1);
        twiddles_storage[465].sin = -0.28440114070400035 * ((2 ** 8) - 1);

        twiddles_storage[466].cos = -0.9604323816829016 * ((2 ** 8) - 1);
        twiddles_storage[466].sin = -0.2785132675742921 * ((2 ** 8) - 1);

        twiddles_storage[467].cos = -0.9621232310094341 * ((2 ** 8) - 1);
        twiddles_storage[467].sin = -0.2726149085284352 * ((2 ** 8) - 1);

        twiddles_storage[468].cos = -0.9637778567707017 * ((2 ** 8) - 1);
        twiddles_storage[468].sin = -0.2667062856373519 * ((2 ** 8) - 1);

        twiddles_storage[469].cos = -0.9653961966706881 * ((2 ** 8) - 1);
        twiddles_storage[469].sin = -0.26078762135839584 * ((2 ** 8) - 1);

        twiddles_storage[470].cos = -0.9669781897795259 * ((2 ** 8) - 1);
        twiddles_storage[470].sin = -0.25485913852697367 * ((2 ** 8) - 1);

        twiddles_storage[471].cos = -0.9685237765357902 * ((2 ** 8) - 1);
        twiddles_storage[471].sin = -0.24892106034815653 * ((2 ** 8) - 1);

        twiddles_storage[472].cos = -0.970032898748741 * ((2 ** 8) - 1);
        twiddles_storage[472].sin = -0.2429736103882782 * ((2 ** 8) - 1);

        twiddles_storage[473].cos = -0.9715054996005141 * ((2 ** 8) - 1);
        twiddles_storage[473].sin = -0.2370170125665149 * ((2 ** 8) - 1);

        twiddles_storage[474].cos = -0.9729415236482607 * ((2 ** 8) - 1);
        twiddles_storage[474].sin = -0.23105149114645637 * ((2 ** 8) - 1);

        twiddles_storage[475].cos = -0.9743409168262339 * ((2 ** 8) - 1);
        twiddles_storage[475].sin = -0.22507727072766362 * ((2 ** 8) - 1);

        twiddles_storage[476].cos = -0.9757036264478253 * ((2 ** 8) - 1);
        twiddles_storage[476].sin = -0.21909457623721026 * ((2 ** 8) - 1);

        twiddles_storage[477].cos = -0.9770296012075478 * ((2 ** 8) - 1);
        twiddles_storage[477].sin = -0.2131036329212155 * ((2 ** 8) - 1);

        twiddles_storage[478].cos = -0.9783187911829676 * ((2 ** 8) - 1);
        twiddles_storage[478].sin = -0.20710466633636482 * ((2 ** 8) - 1);

        twiddles_storage[479].cos = -0.9795711478365839 * ((2 ** 8) - 1);
        twiddles_storage[479].sin = -0.20109790234141536 * ((2 ** 8) - 1);

        twiddles_storage[480].cos = -0.9807866240176562 * ((2 ** 8) - 1);
        twiddles_storage[480].sin = -0.19508356708869376 * ((2 ** 8) - 1);

        twiddles_storage[481].cos = -0.9819651739639788 * ((2 ** 8) - 1);
        twiddles_storage[481].sin = -0.18906188701558282 * ((2 ** 8) - 1);

        twiddles_storage[482].cos = -0.983106753303605 * ((2 ** 8) - 1);
        twiddles_storage[482].sin = -0.18303308883599376 * ((2 ** 8) - 1);

        twiddles_storage[483].cos = -0.984211319056517 * ((2 ** 8) - 1);
        twiddles_storage[483].sin = -0.17699739953183158 * ((2 ** 8) - 1);

        twiddles_storage[484].cos = -0.9852788296362439 * ((2 ** 8) - 1);
        twiddles_storage[484].sin = -0.1709550463444509 * ((2 ** 8) - 1);

        twiddles_storage[485].cos = -0.9863092448514279 * ((2 ** 8) - 1);
        twiddles_storage[485].sin = -0.1649062567660976 * ((2 ** 8) - 1);

        twiddles_storage[486].cos = -0.9873025259073369 * ((2 ** 8) - 1);
        twiddles_storage[486].sin = -0.1588512585313451 * ((2 ** 8) - 1);

        twiddles_storage[487].cos = -0.9882586354073258 * ((2 ** 8) - 1);
        twiddles_storage[487].sin = -0.15279027960852173 * ((2 ** 8) - 1);

        twiddles_storage[488].cos = -0.989177537354244 * ((2 ** 8) - 1);
        twiddles_storage[488].sin = -0.14672354819112501 * ((2 ** 8) - 1);

        twiddles_storage[489].cos = -0.9900591971517905 * ((2 ** 8) - 1);
        twiddles_storage[489].sin = -0.14065129268923213 * ((2 ** 8) - 1);

        twiddles_storage[490].cos = -0.9909035816058173 * ((2 ** 8) - 1);
        twiddles_storage[490].sin = -0.13457374172089945 * ((2 ** 8) - 1);

        twiddles_storage[491].cos = -0.9917106589255781 * ((2 ** 8) - 1);
        twiddles_storage[491].sin = -0.1284911241035569 * ((2 ** 8) - 1);

        twiddles_storage[492].cos = -0.992480398724926 * ((2 ** 8) - 1);
        twiddles_storage[492].sin = -0.12240366884539047 * ((2 ** 8) - 1);

        twiddles_storage[493].cos = -0.9932127720234569 * ((2 ** 8) - 1);
        twiddles_storage[493].sin = -0.11631160513672142 * ((2 ** 8) - 1);

        twiddles_storage[494].cos = -0.9939077512476012 * ((2 ** 8) - 1);
        twiddles_storage[494].sin = -0.11021516234137871 * ((2 ** 8) - 1);

        twiddles_storage[495].cos = -0.9945653102316615 * ((2 ** 8) - 1);
        twiddles_storage[495].sin = -0.1041145699880609 * ((2 ** 8) - 1);

        twiddles_storage[496].cos = -0.9951854242187981 * ((2 ** 8) - 1);
        twiddles_storage[496].sin = -0.09801005776169577 * ((2 ** 8) - 1);

        twiddles_storage[497].cos = -0.9957680698619603 * ((2 ** 8) - 1);
        twiddles_storage[497].sin = -0.09190185549479415 * ((2 ** 8) - 1);

        twiddles_storage[498].cos = -0.9963132252247667 * ((2 ** 8) - 1);
        twiddles_storage[498].sin = -0.08579019315879409 * ((2 ** 8) - 1);

        twiddles_storage[499].cos = -0.99682086978233 * ((2 ** 8) - 1);
        twiddles_storage[499].sin = -0.07967530085540395 * ((2 ** 8) - 1);

        twiddles_storage[500].cos = -0.9972909844220299 * ((2 ** 8) - 1);
        twiddles_storage[500].sin = -0.07355740880794037 * ((2 ** 8) - 1);

        twiddles_storage[501].cos = -0.9977235514442334 * ((2 ** 8) - 1);
        twiddles_storage[501].sin = -0.06743674735265792 * ((2 ** 8) - 1);

        twiddles_storage[502].cos = -0.9981185545629603 * ((2 ** 8) - 1);
        twiddles_storage[502].sin = -0.06131354693007827 * ((2 ** 8) - 1);

        twiddles_storage[503].cos = -0.9984759789064969 * ((2 ** 8) - 1);
        twiddles_storage[503].sin = -0.05518803807631553 * ((2 ** 8) - 1);

        twiddles_storage[504].cos = -0.9987958110179557 * ((2 ** 8) - 1);
        twiddles_storage[504].sin = -0.04906045141439406 * ((2 ** 8) - 1);

        twiddles_storage[505].cos = -0.9990780388557823 * ((2 ** 8) - 1);
        twiddles_storage[505].sin = -0.042931017645566845 * ((2 ** 8) - 1);

        twiddles_storage[506].cos = -0.9993226517942083 * ((2 ** 8) - 1);
        twiddles_storage[506].sin = -0.03679996754063108 * ((2 ** 8) - 1);

        twiddles_storage[507].cos = -0.9995296406236518 * ((2 ** 8) - 1);
        twiddles_storage[507].sin = -0.03066753193123706 * ((2 ** 8) - 1);

        twiddles_storage[508].cos = -0.999698997551064 * ((2 ** 8) - 1);
        twiddles_storage[508].sin = -0.02453394170119877 * ((2 ** 8) - 1);

        twiddles_storage[509].cos = -0.9998307162002222 * ((2 ** 8) - 1);
        twiddles_storage[509].sin = -0.018399427777802548 * ((2 ** 8) - 1);

        twiddles_storage[510].cos = -0.9999247916119709 * ((2 ** 8) - 1);
        twiddles_storage[510].sin = -0.012264221123110096 * ((2 ** 8) - 1);

        twiddles_storage[511].cos = -0.9999812202444072 * ((2 ** 8) - 1);
        twiddles_storage[511].sin = -0.006128552725264182 * ((2 ** 8) - 1);

    end
    generate
         genvar j;
             for (j = 0; j < $clog2(FFT_SIZE)-1; j = j + 1) begin : GEN_TWIDDLES_REGS
             always_ff @(posedge clk) twiddles[j] <= twiddles_storage[indexes[j]];
         end
    endgenerate

endmodule
