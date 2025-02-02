import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CardClub extends StatelessWidget {
  const CardClub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print("object");
        },
        borderRadius:
            BorderRadius.circular(16), // Mantiene la animación dentro del radio
        splashColor: Colors.white.withValues(alpha: .2), // Color del splash
        highlightColor: Colors.white.withValues(alpha: .1), // Color de resalte
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.colorB4,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/fe7a/8fe3/f3fda6a348cf4e9f1f56fab40aac79ad?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=IKUzHawUMKxVNhDDV8mZ2jbEgsKcGxN5HJPqxrlPCOeCSPWd4bMSwzLIJ~mf4FzFhb0M-PMpCRtpu44V3JijxE40ABvB-EphxsZN~0Pu6O~FtuVGVDXpeccoT-VzFaE-QqTFFxLI15SJdCvusN4iJfLx9QNVIFcba7XgxaO6VxRQP8eMtmb3mo5IfA0sZdISvGLmdTOqvy0JwYYpt1CfmrpGonQIVCGg5Io5mstjksJPl4H4IBhAyDfgTaR6PNv~UPkVFM1JASubKqdWXdQXBC2A9pZGRZ7jtS1T0GlPLOXYraOuGyX93KkP75jzKyDH7~ZGtMf9bZuzCJ4uduDJ5Q__",
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      child: Text("Abierto"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image.network(
                      "https://s3-alpha-sig.figma.com/img/2a61/cc73/3007f9732030897ccfa07e59a2bb7c9b?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=LeC5tyeElbch5M1VlgzStb4Q4T5GAJItQ2iQKcJf2UMqIdxES6o4Yk5WF4I-IUKdpQ4ujs66jCXy6mfcuad8cZWr2VFKvdobxcQdxwrzH7C4~BJxwCRNPBbxUmSnIQ7ppQV5cNjQ5998FPXhsqudQV~NWemd~F2nsIxo5K47MLq9qn~nqTo5QUfcPin5KrbOqSCmm9WubxX0UzLHAtX22K2CKx5iTeQBHMOT181EnUfxgI3fy-GTcX4n-RezTUq~LuCDUXmhl4X4Iibj8mCdXPtRpAj4nwG6FLD~zHfi~CHtSviLlAUw-V5MipzNxifGGLJL5VMaKL9b4s-M8WZGhA__",
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ibiza Club Lounge",
                          style: AppTextStyles.callout.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorT1,
                          ),
                        ),
                        Text(
                          "Discoteca",
                          style: AppTextStyles.footnote.copyWith(
                            color: AppColors.colorT2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
