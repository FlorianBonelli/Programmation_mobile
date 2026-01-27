import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_icons.dart';
import 'package:formation_flutter/res/app_images.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = generateProduct();

    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0.0,
            start: 0.0,
            end: 0.0,
            height: 300.0,
            child: _ProductPicture(picture: product.picture),
          ),
          Positioned.fill(top: 280, child: _ProductDetails(product: product)),
        ],
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  final String? picture;

  const _ProductPicture({this.picture});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: picture != null
              ? Image.network(picture!, fit: BoxFit.cover)
              : Container(color: AppColors.grey1),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;

  const _ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? '',
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product.brands?.join(', ') ?? '',
                style: const TextStyle(color: AppColors.grey2, fontSize: 16),
              ),
              const SizedBox(height: 20),
              if (product.altName != null) ...[
                Text(
                  product.altName!,
                  style: const TextStyle(
                    color: AppColors.grey3,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
              ],
              _ProductScoreBanner(product: product),
              const SizedBox(height: 20),
              _ProductData(product: product),
              const SizedBox(height: 20),
              const _ProductButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductScoreBanner extends StatelessWidget {
  final Product product;

  const _ProductScoreBanner({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 44,
                  child: NutriScoreWidget(score: product.nutriScore),
                ),
                const AppDivider(axis: Axis.vertical),
                Expanded(
                  flex: 100 - 44,
                  child: NovaScoreWidget(score: product.novaScore),
                ),
              ],
            ),
          ),
          const AppDivider(axis: Axis.horizontal),
          GreenScoreWidget(score: product.greenScore),
        ],
      ),
    );
  }
}

class NutriScoreWidget extends StatelessWidget {
  final ProductNutriScore? score;

  const NutriScoreWidget({super.key, this.score});

  @override
  Widget build(BuildContext context) {
    String asset;
    switch (score) {
      case ProductNutriScore.A:
        asset = AppImages.nutriscoreA;
        break;
      case ProductNutriScore.B:
        asset = AppImages.nutriscoreB;
        break;
      case ProductNutriScore.C:
        asset = AppImages.nutriscoreC;
        break;
      case ProductNutriScore.D:
        asset = AppImages.nutriscoreD;
        break;
      case ProductNutriScore.E:
        asset = AppImages.nutriscoreE;
        break;
      default:
        return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nutri-Score',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(asset, height: 40),
        ],
      ),
    );
  }
}

class NovaScoreWidget extends StatelessWidget {
  final ProductNovaScore? score;

  const NovaScoreWidget({super.key, this.score});

  @override
  Widget build(BuildContext context) {
    String text;
    switch (score) {
      case ProductNovaScore.group1:
        text = 'Aliments non transformés ou transformés minimalement';
        break;
      case ProductNovaScore.group2:
        text = 'Ingrédients culinaires transformés';
        break;
      case ProductNovaScore.group3:
        text = 'Aliments transformés';
        break;
      case ProductNovaScore.group4:
        text = 'Produits alimentaires et boissons ultra-transformés';
        break;
      default:
        text = 'Inconnu';
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Groupe NOVA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(color: AppColors.grey2, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class GreenScoreWidget extends StatelessWidget {
  final ProductGreenScore? score;

  const GreenScoreWidget({super.key, this.score});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String text;
    Color color;

    switch (score) {
      case ProductGreenScore.APlus:
        icon = AppIcons.ecoscore_a_plus;
        text = 'Très faible impact environnemental';
        color = AppColors.greenScoreAPlus;
        break;
      case ProductGreenScore.A:
        icon = AppIcons.ecoscore_a;
        text = 'Très faible impact environnemental';
        color = AppColors.greenScoreA;
        break;
      case ProductGreenScore.B:
        icon = AppIcons.ecoscore_b;
        text = 'Faible impact environnemental';
        color = AppColors.greenScoreB;
        break;
      case ProductGreenScore.C:
        icon = AppIcons.ecoscore_c;
        text = 'Impact modéré sur l\'environnement';
        color = AppColors.greenScoreC;
        break;
      case ProductGreenScore.D:
        icon = AppIcons.ecoscore_d;
        text = 'Impact environnemental élevé';
        color = AppColors.greenScoreD;
        break;
      case ProductGreenScore.E:
        icon = AppIcons.ecoscore_e;
        text = 'Impact environnemental très élevé';
        color = AppColors.greenScoreE;
        break;
      case ProductGreenScore.F:
        icon = AppIcons.ecoscore_f;
        text = 'Impact environnemental très élevé';
        color = AppColors.greenScoreF;
        break;
      default:
        return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EcoScore',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: AppColors.grey2, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  final Axis axis;

  const AppDivider({super.key, required this.axis});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: axis == Axis.vertical ? 1 : double.infinity,
      height: axis == Axis.horizontal ? 1 : double.infinity,
      color: AppColors.grey2.withOpacity(0.1),
    );
  }
}

/// Faire ici Quantité & Vendu
class _ProductData extends StatelessWidget {
  final Product product;

  const _ProductData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductInfoRow(label: 'Quantité', value: product.quantity ?? ''),
        ProductInfoRow(
          label: 'Vendu',
          value: product.manufacturingCountries?.join(', ') ?? '',
          showDivider: false,
        ),
      ],
    );
  }
}

class ProductInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showDivider;

  const ProductInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: AppColors.grey3, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const AppDivider(axis: Axis.horizontal),
      ],
    );
  }
}

/// Faire ici boutons Végétalien & Végétarien
class _ProductButtons extends StatelessWidget {
  const _ProductButtons();

  @override
  Widget build(BuildContext context) {
    return const Placeholder(fallbackHeight: 50);
  }
}
