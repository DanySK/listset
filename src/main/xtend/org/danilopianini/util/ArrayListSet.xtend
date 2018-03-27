package org.danilopianini.util

import java.util.ArrayList
import java.util.Collection

class ArrayListSet<E> extends ListBackedSet<E> {

	new(Collection<? extends E> collection) {
		super(new ArrayList(collection))
	}

	new(int size) { super(new ArrayList(size)) }

	new() { super(new ArrayList) }
}