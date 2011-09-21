#!/bin/sh

for file in AboutScreen.xib AccountHelp.xib AuthDialog.xib Localizable EasySetupViewController.xib ManualSetupViewController.xib LogoutController.xib MainWindow.xib SearchResultsController.xib SettingsController.xib TabBrowserController.xib WebPageController.xib WelcomePage.xib; do
	./localize.sh $file ca ca
	./localize.sh $file cs cs
	./localize.sh $file de de
	./localize.sh $file es es
	./localize.sh $file fr fr
	./localize.sh $file id id
	./localize.sh $file it it
	./localize.sh $file ja ja
	./localize.sh $file ko ko
	./localize.sh $file nl nl
	./localize.sh $file pl pl
	./localize.sh $file pt pt-PT
	./localize.sh $file pt_BR pt
	./localize.sh $file ru ru
	./localize.sh $file th th
	./localize.sh $file tr tr
	./localize.sh $file zh_CN zh-Hans
	./localize.sh $file zh_TW zh-Hant
	./localize.sh $file th th
done

