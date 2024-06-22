part of report_measure;

class HeadingWithSeeMore extends StatelessWidget {
  final String heading;
  final void Function()? onTap;
  const HeadingWithSeeMore({
    super.key,
    required this.heading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoldText(heading, 18, kTextPrimary),
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoldText("See more", 12, kGrey300),
              sizedBoxWidth(8),
              SvgPicture.asset(
                Assets.icons.arrow_right,
                color: kGrey300,
              ),
            ],
          ),
        )
      ],
    );
  }
}
class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Image.asset(
                Assets.images.prashant,
                height: 42,
                width: 42,
                fit: BoxFit.cover,
              ),
            ),
            sizedBoxWidth(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediumText("Welcome Back", 11, kGrey100),
                BoldText("Dr.Jhonson", 16, kTextPrimary),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumText("Monday", 11, kGrey100),
            BoldText("16 April,2024", 16, kTextPrimary),
          ],
        )
      ],
    );
  }
}