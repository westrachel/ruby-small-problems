# The expected outputs of the tfidf method calls aren't the actual outputs
#def tfidf(term, document, documents)
#  tf(term, document) * idf(term, documents)
#end

# docs = [doc1, doc2, doc3]
# where each doc# = string element containing english sentences

# Example:
# puts tfidf("cat", document1, documents)
# Expected output: ~ 1.2
# Actual output: 0

# puts tfidf("cat", document2, documents)
# Expected output was: ~ 1.6
# Actual output was: 0

#  => trace where the error is coming from
# step 1: examine if the outputs of running the tf method are working as expect
#puts tf("cat", document1)
# => 3
#puts tf("cat", document2)
# => 4
#puts tf("cat", document3)
# => 0
# conclusion: the tf methods aren't returning zeros for documents 1 and 2, so the fact
#   that the outputs for the tfidf method calls are zero is due to idf(term, documents) returning zeros

# step 2: examine idf method (the other inner component of tfidf)
def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents / number_of_documents_with_term)
end

# for the example: idf("cat", documents)
# w/in the idf block the following will evaluate as:
# number_of_documents = 3
# number_of_documents_with_term = 2 (only 2 of them have the string word cat)
# the log of 3/2 is going to be 0, b/c whole numbers, not floats are being used, log(3/2) = log(1) 
#  and log(1) is the last evaluated expression of the idf method call's block
#  => so, tfidf("cat", document1, documents) = 3 * 0 = 0 

# the idf method call needs to be updated to convert number_of_documents to a float and number_of_documents_with_term to a float
# in order to get the desired output:
def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.to_f / number_of_documents_with_term.to_f)
end

# Further Exploration:
# Division part of idf could still return issues for certain situations:
#    1. If the number_of_documents_with_term is zero, then a ZeroDivisionError will return
#          <=> this might not be an issue though, b/c that could be useful if one is trying to use
#            the tf_idf method to assess whether or not a really long document has a particular word
#           <=> although there are simpler/more efficient ways to test whether a document has a word
#             that do not include using the tf_idf method
#    2. if the number of documents = number of documents w/ the term then still going to end up w/ a returned zero
#          b/c the division w/in Math.log will be 1.0 and Math.log(1.0) = 0
