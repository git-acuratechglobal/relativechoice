import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AsyncWidget<T> extends StatelessWidget {
  final double height;
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final void Function()? onRetry;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  const AsyncWidget({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: value.when(
        data: data,
        loading: () => LoadingWidget(
          key: UniqueKey(),
          height: height,
        ),
        error: (e, st) => ErrorCustomWidget(
          key: UniqueKey(),
          error: e,
          height: height,
          onRetry: onRetry,
        ),
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipError: skipError,
      ),
    );
  }
}

class AsyncWidgetB<T> extends ConsumerWidget {
  final double height;
  final ProviderBase<AsyncValue<T>> provider;
  final Widget Function(T data) data;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;
  final bool wantLoading;
  const AsyncWidgetB(
      {super.key,
      required this.provider,
      required this.data,
      this.skipLoadingOnReload = false,
      this.skipLoadingOnRefresh = true,
      this.skipError = false,
      this.height = 200,
      this.wantLoading = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(provider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: value.when(
        data: data,
        loading: () => wantLoading
            ? LoadingWidget(
                key: UniqueKey(),
                height: height,
              )
            : SizedBox.shrink(),
        error: (e, st) => ErrorCustomWidget(
          key: UniqueKey(),
          error: e,
          height: height,
          onRetry: () => ref.refresh(provider),
        ),
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipError: skipError,
      ),
    );
  }
}

class ErrorCustomWidget extends ConsumerWidget {
  final Object error;
  final VoidCallback? onRetry;
  final double height;
  const ErrorCustomWidget({
    required this.error,
    required this.onRetry,
    this.height = 200,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              error.toString(),
              maxLines: 6,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey),
              ),
              onPressed: onRetry,
              child: Text(
                "Retry",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final double height;

  const LoadingWidget({
    super.key,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      key: UniqueKey(),
      size: Size.fromHeight(height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.twistingDots(
              size: 38,
              rightDotColor: Color(0xFF005FF2),
              leftDotColor: Color(0xFFD7ED5D)),
          const SizedBox(height: 8),
          Text(
            "Please wait",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class InButtonLoadingWidget extends StatelessWidget {
  const InButtonLoadingWidget(
      {super.key, this.loadingColor, this.height = 100});
  final Color? loadingColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(height),
      key: UniqueKey(),
      child: LoadingAnimationWidget.twistingDots(
          size: 38,
          rightDotColor: loadingColor ?? Color(0xFF005FF2),
          leftDotColor: loadingColor ?? Color(0xFFD7ED5D)),
    );
  }
}

class PageLoadingWidget extends StatelessWidget {
  const PageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Container(
        color: Colors.black38,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                  size: 38,
                  rightDotColor: Color(0xFF005FF2),
                  leftDotColor: Color(0xFFD7ED5D)),
            )),
      ),
    );
  }
}

class PaginationWidget<T> extends StatefulWidget {
  final AsyncValue<PaginationResponse<T>> value;
  final Widget? Function(int, T) itemBuilder;
  final Widget separator;
  final ScrollController? scrollController;
  final VoidCallback onLoadMore;
  final VoidCallback? retry;
  final bool Function() canLoadMore;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final Widget emptyWidget;

  const PaginationWidget({
    super.key,
    required this.value,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.separator,
    required this.emptyWidget,
    required this.canLoadMore,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.scrollController,
    this.retry,
  });

  @override
  State<PaginationWidget<T>> createState() => _PaginationWidgetState<T>();
}

class _PaginationWidgetState<T> extends State<PaginationWidget<T>> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController ?? ScrollController();
    scrollController.addListener(() {
      if (widget.canLoadMore() &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent) {
        widget.onLoadMore.call();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncWidget(
      skipError: true,
      onRetry: widget.retry,
      value: widget.value,
      data: (list) {
        if (list.data.isEmpty) {
          return widget.emptyWidget;
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: ListView.separated(
            padding: widget.padding,
            scrollDirection: widget.scrollDirection,
            controller: scrollController,
            itemCount: list.data.length +
                (widget.value.isRefreshing || widget.value.hasError ? 1 : 0),
            itemBuilder: (context, index) {
              if (index != list.data.length) {
                return widget.itemBuilder(index, list.data[index]);
              } else {
                if (widget.value.isRefreshing) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Please wait"),
                      8.horizontalSpace,
                      Center(
                        child: LoadingAnimationWidget.twistingDots(
                          size: 30,
                          rightDotColor: Colors.white,
                          leftDotColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  );
                } else if (widget.value.hasError) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withAlpha(128),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.value.error.toString(),
                            maxLines: 2,
                          ),
                        ),
                        8.horizontalSpace,
                        OutlinedButton(
                          onPressed: widget.onLoadMore,
                          child: const Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return widget.separator;
            },
          ),
        );
      },
    );
  }
}

// class PaginationWidgetB<E, T extends PaginationResponse<E>> extends StatefulWidget {
//   final AsyncValue<T> value;
//   final Widget? Function(int, E) itemBuilder;
//   final Widget separator;
//   final ScrollController? scrollController;
//   final VoidCallback onLoadMore;
//   final VoidCallback? retry;
//   final bool Function() canLoadMore;
//   final Axis scrollDirection;
//   final EdgeInsets? padding;
//   final Widget emptyWidget;

//   const PaginationWidgetB({
//     super.key,
//     required this.value,
//     required this.itemBuilder,
//     required this.onLoadMore,
//     required this.separator,
//     required this.emptyWidget,
//     required this.canLoadMore,
//     this.padding,
//     this.scrollDirection = Axis.vertical,
//     this.scrollController,
//     this.retry,
//   });

//   @override
//   State<PaginationWidgetB<E, T>> createState() => _PaginationWidgetStateB<E, T>();
// }

// class _PaginationWidgetStateB<E, T extends PaginationResponse<E>>
//     extends State<PaginationWidgetB<E, T>> {
//   late ScrollController scrollController;

//   @override
//   void initState() {
//     super.initState();
//     scrollController = widget.scrollController ?? ScrollController();
//     scrollController.addListener(() {
//       if (widget.canLoadMore() &&
//           scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
//         widget.onLoadMore.call();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AsyncWidget(
//       skipError: true,
//       onRetry: widget.retry,
//       value: widget.value,
//       data: (list) {
//         if (list.data.isEmpty) {
//           return widget.emptyWidget;
//         }
//         return AnimatedSwitcher(
//           duration: const Duration(milliseconds: 250),
//           child: ListView.separated(
//             padding: widget.padding,
//             scrollDirection: widget.scrollDirection,
//             controller: scrollController,
//             itemCount:
//                 list.data.length + (widget.value.isRefreshing || widget.value.hasError ? 1 : 0),
//             itemBuilder: (context, index) {
//               if (index != list.data.length) {
//                 return widget.itemBuilder(index, list.data[index]);
//               } else {
//                 if (widget.value.isRefreshing) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Please wait"),
//                       8.horizontalSpace,
//                       Center(
//                         child: LoadingAnimationWidget.twistingDots(
//                           size: 30,
//                           rightDotColor: Colors.white,
//                           leftDotColor: Theme.of(context).colorScheme.primary,
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (widget.value.hasError) {
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 24.0),
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     width: MediaQuery.sizeOf(context).width,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.5),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.value.error.toString(),
//                             maxLines: 2,
//                           ),
//                         ),
//                         8.horizontalSpace,
//                         OutlinedButton(
//                           onPressed: widget.onLoadMore,
//                           child: const Text(
//                             "Retry",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   return const SizedBox.shrink();
//                 }
//               }
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return widget.separator;
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class PaginationResponse<T> {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final List<T> data;

  PaginationResponse({
    required this.currentPage,
    required this.totalPages,
    required this.data,
    this.totalItems = 0,
  });

  bool get isCompleted => currentPage >= totalPages;

  PaginationResponse<T> copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    List<T>? data,
  }) {
    return PaginationResponse<T>(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      data: data ?? this.data,
    );
  }
}
