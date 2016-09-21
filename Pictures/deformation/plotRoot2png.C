{
  // Small macro to convert root files plot to png and have the setting I want (no box stats, color and better titles)  

//
TFile myFile("RsAlign_226026_pl8_deformed.root","read"); // Useless comment but this line is commented
TH2F *myHisto = (TH2F*)myFile->Get("hAlignPosUU8");

TCanvas *c1 = new TCanvas("c1", "#Delta U=f(U_hit)", 1200,900);

gStyle->SetOptFit(0);
gStyle->SetOptStat(0);
myHisto->SetTitle("#Delta U=f(U_hit) for back side")
myHisto->GetXaxis()->SetTitleOffset(0.8);
myHisto->GetXaxis()->SetTitleSize(0.06);
myHisto->Draw("colz");
c1->Update();

}
