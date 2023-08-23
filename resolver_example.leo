program resolver_example.aleo {
     // Structure holding a name_hash and its type
    struct ResolverIndex {
        name: field, // The name_hash
        category: u128 // The type of the resolver, can contain 16 characters in maximum
    }

    mapping resolvers: ResolverIndex => Name; // Mapping from a ResolverIndex structure to an Name structure(string)
}