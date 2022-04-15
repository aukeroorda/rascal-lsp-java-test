package rascalJava;

// Value types for Rascal
import io.usethesource.vallang.IString;
import io.usethesource.vallang.IInteger;
import io.usethesource.vallang.IValueFactory;

// FuzzyWuzzy
// Temporarily disabled; untill binding of Java functions works
// import me.xdrop.fuzzywuzzy.*;


public class FuzzyWuzzyBinding {
    private final IValueFactory vf;

    public FuzzyWuzzyBinding(IValueFactory vf) {
        this.vf = vf;
    }

    public IInteger fuzz_token_sort_ratio(IString lhs, IString rhs)
    {
    	int result = 0;
    	
    	// result = FuzzySearch.tokenSortRatio(lhs.getValue(), rhs.getValue());
        return vf.integer(result);
    }

    public IInteger fuzz_token_set_ratio(IString lhs, IString rhs)
    {
    	int result = 0;
    	
    	// result = FuzzySearch.tokenSetRatio(lhs.getValue(), rhs.getValue());
        return vf.integer(result);
    }
    
    public IInteger fuzz_weighted_ratio(IString lhs, IString rhs)
    {
    	int result = 0;
    	
    	// result = FuzzySearch.weightedRatio(lhs.getValue(), rhs.getValue());
    	return vf.integer(result);
    }
}
