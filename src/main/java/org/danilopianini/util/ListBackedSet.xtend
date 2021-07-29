package org.danilopianini.util

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.util.List
import org.apache.commons.collections4.list.SetUniqueList
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Delegate
import java.util.Comparator

@Accessors(PROTECTED_GETTER, PROTECTED_SETTER)
class ListBackedSet<E> implements ListSet<E> {

	@Delegate val SetUniqueList<E> backend
	val List<E> base;

	@SuppressFBWarnings("EI_EXPOSE_REP2")
	new(List<E> base) {
		this.base = base;
		backend = SetUniqueList.setUniqueList(base)
	}
	
	override sort(Comparator<? super E> c) {
		base.sort(c)
	}

	override toString() {
		base.toString
	}
	
	override hashCode() {
		base.hashCode
	}
	
	override equals(Object o) {
		base.equals(o)
	}
	
}