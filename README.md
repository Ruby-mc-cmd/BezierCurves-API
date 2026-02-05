# Minecraft Java Datapack用ベジェ曲線関数ライブラリ

１次２次３次のベジェ曲線の座標を出すためのライブラリです

## 使用方法

以下のfunctionを実行します
それぞれ引数が必要となります  
`<>`は実際の値に置き換えてください

### １次ベジェ曲線
```mcfunction
function #yrh.bezier_curves:1-linear {t:<>, p0_x:<>, p0_y:<>, p0_z:<> p1_x:<>, p1_y:<>, p1_z:<>, run_command:"<>"}
```
始点 `p0`  
終点 `p1`  

### ２次ベジェ曲線
```mcfunction
function #yrh.bezier_curves:2-quadratic {t:<>, p0_x:<>, p0_y:<>, p0_z:<> p1_x:<>, p1_y:<>, p1_z:<>, p2_x:<>, p2_y:<>, p2_z:<>, run_command:"<>"}
```
始点 `p0`  
制御点 `p1`  
終点 `p2`  

### ３次ベジェ曲線
```mcfunction
function #yrh.bezier_curves:3-cubic {t:<>, p0_x:<>, p0_y:<>, p0_z:<> p1_x:<>, p1_y:<>, p1_z:<>, p2_x:<>, p2_y:<>, p2_z:<>, p3_x:<>, p3_y:<>, p3_z:<>, run_command:"<>"}
```
始点 `p0`  
制御点１ `p1`  
制御点２ `p2`  
終点 `p3`  

## 引数
- `t` ベジェ曲線の範囲(0≦t≦1)  
  範囲を超えた場合`fail`を返す  
  小数第二位まで反映
  
- `p0_x`,`p0_y`,`p0_z` 第１座標
- `p1_x`,`p1_y`,`p1_z` 第２座標
- `p2_x`,`p2_y`,`p2_z` 第３座標
- `p3_x`,`p3_y`,`p3_z` 第４座標  
  少数第一位まで反映

- `run_command` 実行するコマンド
