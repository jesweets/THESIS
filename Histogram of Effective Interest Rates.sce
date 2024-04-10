
// Initialize r1 as an empty array before the loop
r1 = [];

// One Delay
for m = 1:23
    [q1(m), r1(m)] = gye_delays(m, 23, 0.10);
end

histplot(7, r1, normalization = %f);
xlabel("Interest Rate");
ylabel("Number of Occurrences");
scf;
