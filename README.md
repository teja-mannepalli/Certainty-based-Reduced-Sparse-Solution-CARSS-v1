# Certainty-based-Reduced-Sparse-Solution-CARSS


% The problem to be solved is phi = K J. J is the unknown vector.
% 
% The main function is "CARSS.m". 
% % % % % % % % % % % % % % % % NEEDED INPUT VARIABLES % % % % % % % % % % % % % % %
%   
%   K - Lead Field Matrix. Each column is the voltage distribution of each source.
%   phi - EEG measurement vector at any time instant. 
%   grid struct with dipos matrix representing source locations as 1 X 3 vectors.
%          Ex;- grid.dipos = [1.2  2.5  3.3
%                             2.5  4.5  4.2
%                             3.3  5.5  7.7]  representing three source locations at 
%          [1.2  2.5  3.3], [2.5  4.5  4.2] and [3.3  5.5  7.7].
%  elec struct with chanpos matrix representing channel locations as 1 X 3 vectors.
%  
%          Ex:- elec.chanpos = [2.3  4.2  2.3
%                                 8.6  6.0  -3.3]  representing two channel locations  
% at 
%          [2.3  4.2  2.3] and [8.6  6.0  -3.3].
%  
%  
%  ch is the channel location cutoff such that each channel is surrounded by one  
% level of its surrounding.
%  p- 0   exponential based similarity estimation (Gaussian kernel)
%     1   L1  norm      "      "	"	"	
%     2   L2  norm      "      "	"	"	
% 
%  gd is the source- source one level inter-grid point distance in mm.
%  r is the radius of the head or outer sphere to calculate the geodesic distance in mm.
%  stage2- whether to proceed to stage-II or not.
% % % % % % % % % % % % % % % % OUTPUT VARIABLES % % % % % % % % % % % % % % % % % %  
% % 
%  
%  locs - has neighboring channels for each channel 
%  peak_sch_max, peak_sch_min - are M X 1 matrices contains channel where
%                              global maxima are formed. non-zero of peak_sch_max
%                              for a source implies the global optimum is the global  
% minima.
%                              Similarly, if peak_sch_min is non-zero, it is a global  
% minima
%                              Either of peak_sch_max 
%                              or peak_sch_min will only be non-zero, not both. 
%  Ds is the matrix representing the distance of a source point to all other sources  
% points.
% 
%         Ex:- Ds = [0    2.54   5.72
%                    2.54    0     3.72
%                    5.72  3.72      0  ].
%       Euclidean distance calculated.
% 
%       and similarly,	   
% Delec  is the matrix representing the distance of a channel to all other channels.
% 
%           Ex;- Delec = [  0   5.04
%                           5.04  0  ].
% 
%       Geodistance distance calculated on a sphere of radius 5 above.
% pos_sources,pos_sourcesm - certain sources that may be active. One is by
%                          considering maxima and another by minima in phi.
% pos_sources_all - Similarly, as above combined.
% J_CARSS - The CARSS estimate having the certainty of each source.
% Kr, J_carss - Reduced K and J_CARSS to only non-zeros for stage-II.
% IndDsr, diposr - The above-reduced sources locations for stage-II.
% J_mne - The solution using the reduced variables above. As an example,
%         minimum norm estimate (Hamalainen et al.,1993) is used in stage-II.
% 
% % % % % % For any details, please refer
% Mannepalli, Teja, and Aurobinda Routray. "Certainty-Based Reduced Sparse 
% Solution for Dense Array EEG Source Localization." IEEE Transactions on Neural  
% Systems 
% and Rehabilitation Engineering 27.2 (2018): 172-178.
% 
% The links for the above are 
% https://www.ncbi.nlm.nih.gov/pubmed/30596580           and       
% https://arxiv.org/abs/1812.09506
% Also, please cite if you have used this code in your research.
% 
% 
% If any files are missing or any mistakes, please feel free to inform me at  
% mteja134@gmail.com. 
**
The authors are willing to consider valid mistakes to correct.  
% Thank you.
