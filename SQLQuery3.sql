Use [India Election results];

--Total_Seats

SELECT
COUNT(constituencywise_results.[Parliament Constituency])AS Total_Seats
FROM constituencywise_results;

--Total number of seats available for elections in each states.

SELECT 
states.[State] As State_Name,
COUNT(statewise_results.[Parliament Constituency])As Seats
From statewise_results 
JOIN states
On states.[State ID]=statewise_results.[State ID]
Group By states.[State]
ORDER BY COUNT(statewise_results.[Parliament Constituency]) DESC;

--Total Seats Won by NDA Alliance.

Select* From partywise_results ORDER BY partywise_results.Party;

SELECT
SUM(partywise_results.Won)AS Total_Seats_of_NDA
FROM partywise_results
WHERE partywise_results.[Party] IN( 'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM');


--Seats Won by NDA Alliance Parties.

SELECT
partywise_results.Party AS Party_Name,
partywise_results.Won AS Seats_Won_by_NDA
FROM partywise_results
WHERE partywise_results.[Party] IN( 'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM')
ORDER BY partywise_results.Won DESC;


--Total Seats Won by I.N.D.I.A.

SELECT
SUM(partywise_results.Won)AS Total_Seats_of_INDIA
FROM partywise_results
WHERE partywise_results.[Party] IN( 'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Jharkhand Mukti Morcha - JMM',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK');

--Seats Won by INDIA Alliance Party.

SELECT
partywise_results.Party AS Party_Name,
partywise_results.Won AS Seats_Won_by_INDIA
FROM partywise_results
WHERE partywise_results.[Party] IN( 'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Jharkhand Mukti Morcha - JMM',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK')
ORDER BY partywise_results.Won DESC;


--Add new Column to find out the Party_Alliance names for each column.

ALTER TABLE partywise_results
ADD Party_Alliance VARCHAR(250);

UPDATE partywise_results
SET Party_Alliance= 'I.N.D.I.A'
WHERE partywise_results.Party IN( 'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Jharkhand Mukti Morcha - JMM',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK');

UPDATE partywise_results
SET Party_Alliance= 'NDA'
WHERE partywise_results.Party IN( 'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM');

UPDATE partywise_results
SET Party_Alliance= 'OTHER'
WHERE partywise_results.Party IN('Aazad Samaj Party (Kanshi Ram) - ASPKR',
'All India Majlis-E-Ittehadul Muslimeen - AIMIM',
'Independent - IND',
'Shiromani Akali Dal - SAD',
'United People’s Party, Liberal - UPPL',
'Voice of the People Party - VOTPP',
'Yuvajana Sramika Rythu Congress Party - YSRCP',
'Zoram People’s Movement - ZPM');

--Party Alliance that won the most seats across the all states.

SELECT partywise_results.Party_Alliance,
SUM(partywise_results.Won) AS Total_Seats
FROM partywise_results
GROUP BY partywise_results.Party_Alliance
ORDER BY SUM(partywise_results.Won) DESC;


--Winning candidate name, Party name, Total votes, The margin of victory, State Of Kaziranga Constituency.

SELECT constituencywise_results.[Winning Candidate],
partywise_results.Party,
partywise_results.Party_Alliance,
constituencywise_results.[Total Votes],
constituencywise_results.Margin,
states.[State],
constituencywise_results.[Constituency Name]
FROM constituencywise_results JOIN partywise_results
ON constituencywise_results.[Party ID]=partywise_results.[Party ID]
JOIN statewise_results 
ON statewise_results.[Parliament Constituency]=constituencywise_results.[Parliament Constituency]
JOIN states ON states.[State ID]=statewise_results.[State ID]
WHERE constituencywise_results.[Constituency Name]='KAZIRANGA';

--Distribution of EVM Votes Vurses Postal Votes for Cadidates in KAZIRANGA.

SELECT constituencywise_details.Candidate,
constituencywise_results.[Constituency Name],
constituencywise_details.[EVM Votes],
constituencywise_details.[Postal Votes],
constituencywise_details.[Total Votes]
FROM constituencywise_details JOIN constituencywise_results
ON constituencywise_details.[Constituency ID]=constituencywise_results.[Constituency ID]
WHERE  constituencywise_results.[Constituency Name]='KAZIRANGA';


--Find which party won the most seats in Assam state and how many seats did each party win.

Select partywise_results.Party,
COUNT(constituencywise_results.[Constituency ID]) AS Total_Seats_Won
FROM partywise_results JOIN constituencywise_results
ON partywise_results.[Party ID]=constituencywise_results.[Party ID]
JOIN statewise_results 
ON constituencywise_results.[Parliament Constituency]=statewise_results.[Parliament Constituency]
JOIN states ON states.[State ID]=statewise_results.[State ID]
WHERE states.[State]='Assam'
GROUP BY partywise_results.Party
ORDER BY COUNT(constituencywise_results.[Constituency ID])DESC;

--Total number of seats won by each party alliance(NDA,I.N.D.I.A & OTHER) in each states.

SELECT partywise_results.Party_Alliance,
states.[State],
COUNT(constituencywise_results.[Constituency ID]) AS Total_Seats_Won
FROM partywise_results JOIN constituencywise_results
ON partywise_results.[Party ID]=constituencywise_results.[Party ID]
JOIN statewise_results 
ON constituencywise_results.[Parliament Constituency]=statewise_results.[Parliament Constituency]
JOIN states ON states.[State ID]=statewise_results.[State ID]
GROUP BY partywise_results.Party_Alliance, states.[State]
ORDER BY states.[State], COUNT(constituencywise_results.[Constituency ID])  DESC;


--Candidate name that Received the highest number of EVM votes in Each Constituency.

SELECT
RC.[Constituency ID],
RC.[Constituency Name],
RC.Candidate,
RC.[EVM Votes]
FROM (
SELECT
constituencywise_details.[Constituency ID],
constituencywise_results.[Constituency Name],
constituencywise_details.Candidate,
constituencywise_details.[EVM Votes],
ROW_NUMBER() 
OVER(PARTITION BY constituencywise_details.[Constituency ID] 
ORDER BY constituencywise_details.[EVM Votes] DESC)
AS rank_position 
FROM constituencywise_details JOIN constituencywise_results
ON constituencywise_details.[Constituency ID]=constituencywise_results.[Constituency ID]
 ) AS RC
WHERE RC.rank_position=1
ORDER BY RC.[EVM Votes] DESC;