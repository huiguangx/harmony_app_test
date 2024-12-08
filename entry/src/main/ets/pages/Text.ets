import measure from '@ohos.measure';
import curves from '@ohos.curves';
import display from '@ohos.display';

@Entry
@Component
export struct TextExpandCollapse {
  // 长文本
  @State longMessage: string ='HarmonyOS提供了一套UI开发框架，即方舟开发框架（ArkUI框架）。方舟开发框架可为开发者提供应用方舟开发框架可为开发者提供应用方舟开发框架可为开发者提供应用方舟开发框架可为开发者提供应用方舟开发框架可为开发者提供应用UI开发拉开就够啦过节啦'

  // 最大显示行数
  @State lines: number = 3;
  // 长文本状态（展开 or 收起）
  @State collapseText: string = '…展开全文'
  // 屏幕宽度（单位px）
  screenWidth: number = 0;
  // 是否需要显示"展开"字样（注：当文本长度较短时就不需要“展开”）
  @State isExpanded: boolean = false
  // 测量文本宽度（单位px）
  @State textWidth: number = measure.measureText({
    textContent: this.longMessage,
    fontSize: 15
  })

  aboutToAppear() {
    console.info(`文本宽度为：${this.textWidth}`)
    let displayClass = display.getDefaultDisplaySync();
    //单位为像素
    this.screenWidth = displayClass.width;
    // 屏幕宽度 * 最大行数 * 组件宽度比例 和 文字测量宽度
    this.isExpanded = this.screenWidth * this.lines * 0.8 <= this.textWidth
  }

  build() {
    Row() {
      Column() {
        if (this.isExpanded) {
          Column() {
            Text(this.longMessage)
              .fontSize(15)
              .fontColor(Color.Black)
              .maxLines(this.lines)
              .width('100%')
            Row() {
              Text(this.collapseText)
                .fontSize(15)
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
            }
            .width('100%')
            .justifyContent(FlexAlign.End)
            .onClick(() => {
              if (this.collapseText == '…展开全文') {
                this.collapseText = '…收起';
                // 展开动画
                animateTo({
                  duration: 150,
                  curve: curves.springMotion(0.5, 0.8),
                }, () => {
                  this.lines = -1; // 使得设置的最大行属性无效
                })
              } else {
                this.collapseText = '…展开全文';
                // 收起动画
                animateTo({
                  duration: 100,
                  curve: Curve.Friction,
                }, () => {
                  this.lines = 3; // 只显示3行
                })
              }
            })
          }

          .justifyContent(FlexAlign.Start)
        } else {
          Text(this.longMessage)
            .fontSize(15)
            .fontColor(Color.Black)
        }
      }
      .width('100%')
    }
    .padding({left: 24, right: 24})
    .height('auto')
  }
}