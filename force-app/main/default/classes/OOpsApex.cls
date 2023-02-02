public class OOpsApex{
    
    final integer Only_One_Slice =  8;
    final integer BTW_Two_Three_Slice = 7;
    final integer MoreThan_Three_Slice = 6;
    
        public integer getPayAmount(integer numberOfSlice){
               integer getAmount = numberOfSlice == 1 ? Only_One_Slice*numberOfSlice :
            (numberOfSlice <=3 ? BTW_Two_Three_Slice * numberOfSlice : MoreThan_Three_Slice * numberOfSlice);
           
            return getAmount;
        }
 
}